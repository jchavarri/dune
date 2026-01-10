open Import
open Fiber.O
module Client = Dune_rpc_client.Client
module Version_error = Dune_rpc_private.Version_error

include struct
  open Dune_rpc
  module Diagnostic = Diagnostic
  module Progress = Progress
  module Job = Job
  module Sub = Sub
  module Conv = Conv
end

(** Utility module for generating [Map] modules for [Diagnostic]s and [Job]s which use
    their [Id] as keys. *)
module Id_map (Id : sig
    type t

    val compare : t -> t -> Ordering.t
    val sexp : (t, Conv.values) Conv.t
  end) =
struct
  include Map.Make (struct
      include Id

      let to_dyn t = Sexp.to_dyn (Conv.to_sexp Id.sexp t)
    end)
end

module Diagnostic_id_map = Id_map (Diagnostic.Id)
module Job_id_map = Id_map (Job.Id)

module Event = struct
  (** Events that the render loop will process. *)
  type t =
    | Diagnostics of Diagnostic.Event.t list
    | Jobs of Job.Event.t list
    | Progress of Progress.t
end

module State : sig
  (** Internal state of the render loop. *)
  type t

  (** Initial empty state. *)
  val init : unit -> t

  module Update : sig
    (** Incremental updates to the state. Computes increments of the state that
        will be used for efficient rendering. *)
    type t
  end

  val update : t -> Event.t -> Update.t

  (** Given a state update, render the update. *)
  val render : t -> Update.t -> unit
end = struct
  type t =
    { mutable diagnostics : Diagnostic.t Diagnostic_id_map.t
    ; mutable jobs : Job.t Job_id_map.t
    ; mutable progress : Progress.t
    }

  let init () =
    { diagnostics = Diagnostic_id_map.empty; jobs = Job_id_map.empty; progress = Waiting }
  ;;

  let format_elapsed started_at =
    let elapsed = Unix.gettimeofday () -. started_at in
    if elapsed < 60.0
    then sprintf "%.0fs" elapsed
    else sprintf "%.0fm%.0fs" (floor (elapsed /. 60.0)) (mod_float elapsed 60.0)
  ;;

  let format_job_description job =
    let desc = Format.asprintf "%a" Pp.to_fmt (Job.description job) in
    (* Truncate long descriptions *)
    if String.length desc > 60 then String.sub desc ~pos:0 ~len:57 ^ "..." else desc
  ;;

  let done_status ~complete ~remaining ~failed state =
    let running_count = Job_id_map.cardinal state.jobs in
    let queued = max 0 (remaining - running_count) in
    Pp.textf
      "%d/%d done, %d running, %d queued%s"
      complete
      (complete + remaining)
      running_count
      queued
      (match failed with
       | 0 -> ""
       | failed -> sprintf ", %d failed" failed)
  ;;

  let render_running_jobs state =
    let jobs = Job_id_map.to_list state.jobs in
    if List.is_empty jobs
    then ()
    else (
      (* Sort by start time, oldest first *)
      let sorted =
        List.sort jobs ~compare:(fun (_, a) (_, b) ->
          Float.compare (Job.started_at a) (Job.started_at b))
      in
      List.iter sorted ~f:(fun (_id, job) ->
        let elapsed = format_elapsed (Job.started_at job) in
        let desc = format_job_description job in
        Console.print_user_message
          (User_message.make [ Pp.textf "  [%s] %s" elapsed desc ])))
  ;;

  let waiting_for_file_system_changes message =
    Pp.seq message (Pp.verbatim ", waiting for filesystem changes...")
  ;;

  let restarting_current_build message =
    Pp.seq message (Pp.verbatim ", restarting current build...")
  ;;

  let had_errors state =
    match Diagnostic_id_map.cardinal state.diagnostics with
    | 1 -> Pp.verbatim "Had 1 error"
    | n -> Pp.textf "Had %d errors" n
  ;;

  let status (state : t) =
    Console.Status_line.set
      (Live
         (fun () ->
           match (state.progress : Progress.t) with
           | Waiting -> Pp.verbatim "Initializing..."
           | In_progress { complete; remaining; failed } ->
             done_status ~complete ~remaining ~failed state
           | Interrupted ->
             Pp.tag User_message.Style.Error (Pp.verbatim "Source files changed")
             |> restarting_current_build
           | Success ->
             Pp.tag User_message.Style.Success (Pp.verbatim "Success")
             |> waiting_for_file_system_changes
           | Failed ->
             Pp.tag User_message.Style.Error (had_errors state)
             |> waiting_for_file_system_changes))
  ;;

  module Update = struct
    type t =
      | Update_status
      | Update_jobs
      | Add_diagnostics of Diagnostic.t list
      | Refresh

    let jobs state jobs =
      let jobs =
        List.fold_left jobs ~init:state.jobs ~f:(fun acc job_event ->
          match (job_event : Job.Event.t) with
          | Start job -> Job_id_map.add_exn acc job.id job
          | Stop id -> Job_id_map.remove acc id)
      in
      state.jobs <- jobs;
      Update_jobs
    ;;

    let progress state progress =
      state.progress <- progress;
      Update_status
    ;;

    let diagnostics state diagnostics =
      let mode, diagnostics =
        List.fold_left
          diagnostics
          ~init:(`Add_only [], state.diagnostics)
          ~f:(fun (mode, acc) diag_event ->
            match (diag_event : Diagnostic.Event.t) with
            | Remove diag -> `Remove, Diagnostic_id_map.remove acc diag.id
            | Add diag ->
              ( (match mode with
                 | `Add_only diags -> `Add_only (diag :: diags)
                 | `Remove -> `Remove)
              , Diagnostic_id_map.add_exn acc diag.id diag ))
      in
      state.diagnostics <- diagnostics;
      match mode with
      | `Add_only update -> Add_diagnostics (List.rev update)
      | `Remove -> Refresh
    ;;
  end

  let update state (event : Event.t) =
    match event with
    | Jobs jobs -> Update.jobs state jobs
    | Progress progress -> Update.progress state progress
    | Diagnostics diagnostics -> Update.diagnostics state diagnostics
  ;;

  let render =
    let f d = Console.print_user_message (Diagnostic.to_user_message d) in
    fun (state : t) (update : Update.t) ->
      (match (update : Update.t) with
       | Add_diagnostics diags -> List.iter diags ~f
       | Update_status -> ()
       | Update_jobs -> render_running_jobs state
       | Refresh ->
         Console.reset ();
         Diagnostic_id_map.iter state.diagnostics ~f;
         render_running_jobs state);
      status state
  ;;
end

(* A generic loop that continuously fetches events from a [sub] that it opens a
   poll to and writes them to the [event] bus. *)
let fetch_loop ~(event : Event.t Fiber_event_bus.t) ~client ~f sub =
  Client.poll client sub
  >>= function
  | Error version_error ->
    let* () = Fiber_event_bus.close event in
    User_error.raise [ Pp.verbatim (Version_error.message version_error) ]
  | Ok poller ->
    let rec loop () =
      Fiber.collect_errors (fun () -> Client.Stream.next poller)
      >>= (function
       | Ok (Some payload) -> Fiber_event_bus.push event (f payload)
       | Error _ | Ok None -> Fiber_event_bus.close event >>> Fiber.return `Closed)
      >>= function
      | `Closed -> Fiber.return ()
      | `Ok -> loop ()
    in
    loop ()
;;

(* Main render loop *)
let render_loop ~(event : Event.t Fiber_event_bus.t) =
  Console.reset ();
  let state = State.init () in
  let rec loop () =
    Fiber_event_bus.pop event
    >>= function
    | `Closed ->
      Console.print_user_message
        (User_error.make [ Pp.textf "Lost connection to server." ]);
      Fiber.return ()
    | `Next event ->
      let update = State.update state event in
      (* CR-someday alizter: If performance of rendering here on every loop is bad we can
         instead batch updates. It should be very simple to write a [State.Update.union]
         function that can combine incremental updates to be done at once. *)
      State.render state update;
      loop ()
  in
  loop ()
;;

let monitor ~quit_on_disconnect () =
  Fiber.repeat_while ~init:1 ~f:(fun i ->
    match Dune_rpc_impl.Where.get () with
    | Some where ->
      let* connect = Client.Connection.connect_exn where in
      let+ () =
        Dune_rpc_impl.Client.client
          connect
          (Dune_rpc.Initialize.Request.create
             ~id:(Dune_rpc.Id.make (Sexp.Atom "monitor_cmd")))
          ~f:(fun client ->
            let event = Fiber_event_bus.create () in
            let module Sub = Dune_rpc_private.Public.Sub in
            Fiber.all_concurrently_unit
              [ render_loop ~event
              ; fetch_loop ~event ~client ~f:(fun x -> Event.Jobs x) Sub.running_jobs
              ; fetch_loop ~event ~client ~f:(fun x -> Event.Progress x) Sub.progress
              ; fetch_loop ~event ~client ~f:(fun x -> Event.Diagnostics x) Sub.diagnostic
              ])
      in
      Some i
    | None when quit_on_disconnect ->
      User_error.raise [ Pp.text "RPC server not running." ]
    | None ->
      Console.Status_line.set
        (Console.Status_line.Live
           (fun () -> Pp.verbatim ("Waiting for RPC server" ^ String.make (i mod 4) '.')));
      let+ () = Scheduler.sleep (Time.Span.of_secs 0.3) in
      Some (i + 1))
;;

let man =
  [ `S "DESCRIPTION"
  ; `P
      "$(b,dune monitor) connects to an RPC server running in the current workspace and \
       displays the build progress and diagnostics. If no server is running or it was \
       disconnected, it will continuously try to reconnect."
  ]
;;

let command =
  let info =
    let doc = "Connect to a Dune RPC server and monitor it." in
    Cmd.info "monitor" ~doc ~man
  and term =
    let open Import in
    let+ builder = Common.Builder.term
    and+ quit_on_disconnect =
      Arg.(
        value
        & flag
        & info
            [ "quit-on-disconnect" ]
            ~doc:(Some "Quit if the connection to the server is lost."))
    in
    let builder = Common.Builder.forbid_builds builder in
    let builder = Common.Builder.disable_log_file builder in
    let _common, config = Common.init builder in
    let config =
      Dune_config.for_scheduler
        config
        (Dune_trace.global ())
        ~print_ctrl_c_warning:true
        ~watch_exclusions:[]
    in
    Scheduler.Run.go
      config
      ~on_event:(fun _ _ -> ())
      ~file_watcher:No_watcher
      (monitor ~quit_on_disconnect)
  in
  Cmd.v info term
;;
