open Import
open Memo.O

type t =
  { project : Dune_project.t
  ; db : Lib.DB.t
  ; coq_db : Coq_lib.DB.t Memo.Lazy.t
  ; root : Path.Build.t
  }

let root t = t.root
let project t = t.project
let libs t = t.db
let coq_libs t = Memo.Lazy.force t.coq_db

module DB = struct
  type scope = t
  type t = { by_dir : scope Path.Source.Map.t }

  let find_by_dir t dir = Find_closest_source_dir.find_by_dir t.by_dir ~dir

  let find_by_project t project =
    Path.Source.Map.find_exn t.by_dir (Dune_project.root project)
  ;;

  module Found_or_redirect : sig
    type t = private
      | Found of Lib_info.external_
      | Redirect of (Loc.t * Lib_name.t) * Toggle.t Memo.Lazy.t
      | Deprecated_library_name of (Loc.t * Lib_name.t)

    val redirect
      :  enabled:Toggle.t Memo.Lazy.t
      -> Lib_name.t
      -> Loc.t * Lib_name.t
      -> Lib_name.t * t

    val deprecated_library_name : Lib_name.t -> Loc.t * Lib_name.t -> Lib_name.t * t
    val found : Lib_info.external_ -> t
  end = struct
    type t =
      | Found of Lib_info.external_
      | Redirect of (Loc.t * Lib_name.t) * Toggle.t Memo.Lazy.t
      | Deprecated_library_name of (Loc.t * Lib_name.t)

    let redirect ~enabled from (loc, to_) =
      if Lib_name.equal from to_
      then Code_error.raise ~loc "Invalid redirect" [ "to_", Lib_name.to_dyn to_ ]
      else from, Redirect ((loc, to_), enabled)
    ;;

    let deprecated_library_name from (loc, to_) =
      if Lib_name.equal from to_
      then Code_error.raise ~loc "Invalid redirect" [ "to_", Lib_name.to_dyn to_ ]
      else from, Deprecated_library_name (loc, to_)
    ;;

    let found x = Found x
  end

  let find_stanza_id id_map name =
    Memo.return
    @@
    match Lib_name.Map.find id_map name with
    | None | Some [] -> []
    | Some xs -> xs
  ;;

  module Library_related_stanza = struct
    type t =
      | Library of Path.Build.t * Library.t
      | Library_redirect of Path.Build.t * Library_redirect.Local.t
      | Deprecated_library_name of Path.Build.t * Deprecated_library_name.t
  end

  let create_db_from_stanzas ~instrument_with ~parent ~lib_config stanzas =
    let map, id_map =
      let libs =
        List.map stanzas ~f:(fun stanza ->
          match (stanza : Library_related_stanza.t) with
          | Library_redirect (dir, s) ->
            let old_public_name = Lib_name.of_local s.old_name.lib_name in
            let enabled =
              Memo.lazy_ (fun () ->
                let open Memo.O in
                let* expander = Expander0.get ~dir in
                let+ enabled = Expander0.eval_blang expander s.old_name.enabled in
                Toggle.of_bool enabled)
            in
            let lib_name, redirect =
              Found_or_redirect.redirect ~enabled old_public_name s.new_public_name
            in
            let library_id =
              let src_dir = Path.drop_optional_build_context_src_exn (Path.build dir) in
              ( Library.Id.make ~loc:s.loc ~src_dir ~enabled_if:s.old_name.enabled lib_name
              , redirect )
            in
            lib_name, library_id
          | Deprecated_library_name (dir, s) ->
            let old_public_name = Deprecated_library_name.old_public_name s in
            let lib_name, deprecated_lib =
              Found_or_redirect.deprecated_library_name old_public_name s.new_public_name
            in
            let src_dir = Path.drop_optional_build_context_src_exn (Path.build dir) in
            lib_name, (Deprecated_library_name.to_id ~src_dir s, deprecated_lib)
          | Library (dir, (conf : Library.t)) ->
            let info =
              let expander = Expander0.get ~dir in
              Library.to_lib_info conf ~expander ~dir ~lib_config |> Lib_info.of_local
            in
            let stanza_id =
              let src_dir = Path.drop_optional_build_context_src_exn (Path.build dir) in
              Library.Id.of_stanza ~src_dir conf
            in
            Library.best_name conf, (stanza_id, Found_or_redirect.found info))
      in
      let (_ : (Library.Id.t * Found_or_redirect.t) Lib_name.Map.t) =
        libs
        |> Lib_name.Map.of_list_reducei
             ~f:(fun name (v1 : Library.Id.t * Found_or_redirect.t) v2 ->
               let res =
                 match snd v1, snd v2 with
                 | Found _, Found _
                 | Found _, Redirect _
                 | Redirect _, Found _
                 | Redirect _, Redirect _ -> Ok v1
                 | Found info, Deprecated_library_name (loc, _)
                 | Deprecated_library_name (loc, _), Found info ->
                   Error (loc, Lib_info.loc info)
                 | Deprecated_library_name (loc2, lib2), Redirect ((loc1, lib1), _)
                 | Redirect ((loc1, lib1), _), Deprecated_library_name (loc2, lib2) ->
                   if Lib_name.equal lib1 lib2 then Ok v1 else Error (loc1, loc2)
                 | ( Deprecated_library_name (loc1, lib1)
                   , Deprecated_library_name (loc2, lib2) ) ->
                   if Lib_name.equal lib1 lib2 then Ok v1 else Error (loc1, loc2)
               in
               match res with
               | Ok x -> x
               | Error (loc1, loc2) ->
                 let main_message =
                   Pp.textf "Library %s is defined twice:" (Lib_name.to_string name)
                 in
                 let annots =
                   let main = User_message.make ~loc:loc2 [ main_message ] in
                   let related =
                     [ User_message.make ~loc:loc1 [ Pp.text "Already defined here" ] ]
                   in
                   User_message.Annots.singleton
                     Compound_user_error.annot
                     [ Compound_user_error.make ~main ~related ]
                 in
                 User_error.raise
                   ~annots
                   [ main_message
                   ; Pp.textf "- %s" (Loc.to_file_colon_line loc1)
                   ; Pp.textf "- %s" (Loc.to_file_colon_line loc2)
                   ])
      in
      let id_map =
        let libs = List.map libs ~f:(fun (name, (id, _lib)) -> name, id) in
        Lib_name.Map.of_list_multi libs
      and map =
        let libs = List.map libs ~f:snd in
        Library.Id.Map.of_list_exn libs
      in
      map, id_map
    in
    let find_stanza_id = find_stanza_id id_map in
    Lib.DB.create
      ()
      ~parent:(Some parent)
      ~find_stanza_id
      ~resolve:(fun library_id ->
        match Library.Id.Map.find map library_id with
        | None -> Memo.return Lib.DB.Resolve_result.not_found
        | Some (Redirect (lib, enabled)) ->
          let+ enabled =
            let+ toggle = Memo.Lazy.force enabled in
            Toggle.enabled toggle
          in
          if enabled
          then Lib.DB.Resolve_result.redirect_in_the_same_db lib
          else Lib.DB.Resolve_result.not_found
        | Some (Found lib) -> Memo.return (Lib.DB.Resolve_result.found lib)
        | Some (Deprecated_library_name lib) ->
          Memo.return (Lib.DB.Resolve_result.deprecated_library_name lib))
      ~all:(fun () -> Memo.return @@ Library.Id.Map.keys map)
      ~lib_config
      ~instrument_with
  ;;

  type redirect_to =
    | Project of
        { project : Dune_project.t
        ; library_id : Library.Id.t
        }
    | Name of (Loc.t * Lib_name.t)

  let resolve t public_libs library_id : Lib.DB.Resolve_result.t =
    match Library.Id.Map.find public_libs library_id with
    | None -> Lib.DB.Resolve_result.not_found
    | Some (Project { project; library_id }) ->
      let scope = find_by_project (Fdecl.get t) project in
      Lib.DB.Resolve_result.redirect scope.db library_id
    | Some (Name name) -> Lib.DB.Resolve_result.redirect_in_the_same_db name
  ;;

  let public_theories ~find_db ~installed_theories coq_stanzas =
    List.filter_map coq_stanzas ~f:(fun (dir, (stanza : Coq_stanza.Theory.t)) ->
      if Option.is_some stanza.package
      then Some (stanza, Coq_lib.DB.Entry.Theory dir)
      else None)
    |> Coq_lib.DB.create_from_coqlib_stanzas ~find_db ~parent:(Some installed_theories)
  ;;

  (* Create a database from the public libraries defined in the stanzas *)
  let public_libs t ~installed_libs ~lib_config stanzas =
    let public_libs, public_ids =
      let public_libs, public_ids =
        let libs =
          List.filter_map stanzas ~f:(fun (stanza : Library_related_stanza.t) ->
            match stanza with
            | Library (dir, ({ project; visibility = Public p; _ } as conf)) ->
              let library_id =
                let src_dir = Path.drop_optional_build_context_src_exn (Path.build dir) in
                Library.Id.of_stanza ~src_dir conf
              in
              Some (Public_lib.name p, Project { project; library_id }, library_id)
            | Library _ | Library_redirect _ -> None
            | Deprecated_library_name (dir, s) ->
              let old_name = Deprecated_library_name.old_public_name s in
              let src_dir = Path.drop_optional_build_context_src_exn (Path.build dir) in
              Some
                ( old_name
                , Name s.new_public_name
                , Deprecated_library_name.to_id ~src_dir s ))
        in
        List.fold_left
          libs
          ~init:([], [])
          ~f:(fun (public_libs, public_ids) (name, redirect_to, id) ->
            (id, redirect_to) :: public_libs, (name, id) :: public_ids)
      in
      let public_ids = Lib_name.Map.of_list_multi public_ids
      and public_libs =
        match Library.Id.Map.of_list public_libs with
        | Ok x -> x
        | Error (library_id, _, _) ->
          (match
             List.filter_map stanzas ~f:(fun stanza ->
               let named p ~lib_id loc =
                 Option.some_if
                   (Library.Id.equal library_id lib_id)
                   (Public_lib.name p, loc)
               in
               match stanza with
               | Library
                   (dir, ({ buildable = { loc; _ }; visibility = Public p; _ } as conf))
                 ->
                 let library_id =
                   let src_dir =
                     Path.drop_optional_build_context_src_exn (Path.build dir)
                   in
                   Library.Id.of_stanza ~src_dir conf
                 in
                 named p ~lib_id:library_id loc
               | Deprecated_library_name
                   (dir, ({ Library_redirect.loc; old_name = p, _; _ } as conf)) ->
                 let library_id =
                   let src_dir =
                     Path.drop_optional_build_context_src_exn (Path.build dir)
                   in
                   Deprecated_library_name.to_id ~src_dir conf
                 in
                 named p ~lib_id:library_id loc
               | _ -> None)
           with
           | [] | [ _ ] -> assert false
           | (name, loc1) :: (_, loc2) :: _ ->
             let main_message =
               Pp.textf "Public library %s is defined twice:" (Lib_name.to_string name)
             in
             let annots =
               let main = User_message.make ~loc:loc2 [ main_message ] in
               let related =
                 [ User_message.make ~loc:loc1 [ Pp.text "Already defined here" ] ]
               in
               User_message.Annots.singleton
                 Compound_user_error.annot
                 [ Compound_user_error.make ~main ~related ]
             in
             User_error.raise
               ~annots
               ~loc:loc2
               [ Pp.textf "Public library %s is defined twice:" (Lib_name.to_string name)
               ; Pp.textf "- %s" (Loc.to_file_colon_line loc1)
               ; Pp.textf "- %s" (Loc.to_file_colon_line loc2)
               ])
      in
      public_libs, public_ids
    in
    let resolve lib = Memo.return (resolve t public_libs lib)
    and find_stanza_id = find_stanza_id public_ids in
    Lib.DB.create
      ~parent:(Some installed_libs)
      ~find_stanza_id
      ~resolve
      ~all:(fun () -> Library.Id.Map.keys public_libs |> Memo.return)
      ~lib_config
      ()
  ;;

  module Path_source_map_traversals = Memo.Make_map_traversals (Path.Source.Map)

  let coq_scopes_by_dir db_by_project_dir projects_by_dir public_theories coq_stanzas =
    let coq_stanzas_by_project_dir =
      List.map coq_stanzas ~f:(fun (dir, (stanza : Coq_stanza.Theory.t)) ->
        let project = stanza.project in
        Dune_project.root project, (dir, stanza))
      |> Path.Source.Map.of_list_multi
    in
    let parent = Some public_theories in
    let find_db dir = snd (Find_closest_source_dir.find_by_dir db_by_project_dir ~dir) in
    Path.Source.Map.merge
      projects_by_dir
      coq_stanzas_by_project_dir
      ~f:(fun _dir project coq_stanzas ->
        assert (Option.is_some project);
        let coq_stanzas = Option.value coq_stanzas ~default:[] in
        List.map coq_stanzas ~f:(fun (dir, (stanza : Coq_stanza.Theory.t)) ->
          let (entry : Coq_lib.DB.Entry.t) =
            match stanza.package with
            | None -> Theory dir
            | Some _ -> Redirect public_theories
          in
          stanza, entry)
        |> Coq_lib.DB.create_from_coqlib_stanzas ~parent ~find_db
        |> Option.some)
  ;;

  let scopes_by_dir
    ~build_dir
    ~lib_config
    ~projects_by_root
    ~public_libs
    ~public_theories
    ~instrument_with
    stanzas
    coq_stanzas
    =
    let stanzas_by_project_dir =
      List.map stanzas ~f:(fun (stanza : Library_related_stanza.t) ->
        let project =
          match stanza with
          | Library (_, lib) -> lib.project
          | Library_redirect (_, x) -> x.project
          | Deprecated_library_name (_, x) -> x.project
        in
        Dune_project.root project, stanza)
      |> Path.Source.Map.of_list_multi
    in
    let db_by_project_dir =
      Path.Source.Map.merge
        projects_by_root
        stanzas_by_project_dir
        ~f:(fun _dir project stanzas ->
          let project = Option.value_exn project in
          let stanzas = Option.value stanzas ~default:[] in
          Some (project, stanzas))
      |> Path.Source.Map.map ~f:(fun (project, stanzas) ->
        let db =
          create_db_from_stanzas stanzas ~instrument_with ~parent:public_libs ~lib_config
        in
        project, db)
    in
    let coq_scopes_by_dir =
      Memo.Lazy.map public_theories ~f:(fun public_theories ->
        coq_scopes_by_dir db_by_project_dir projects_by_root public_theories coq_stanzas)
    in
    let coq_db_find dir =
      Memo.Lazy.map coq_scopes_by_dir ~f:(fun x -> Path.Source.Map.find_exn x dir)
    in
    Path.Source.Map.mapi db_by_project_dir ~f:(fun dir (project, db) ->
      let root = Path.Build.append_source build_dir (Dune_project.root project) in
      let coq_db = coq_db_find dir in
      { project; db; coq_db; root })
  ;;

  let create ~context ~projects_by_root stanzas coq_stanzas =
    let open Memo.O in
    let t = Fdecl.create Dyn.opaque in
    let* context = Context.DB.get context in
    let build_dir = Context.build_dir context in
    let* lib_config =
      let+ ocaml = Context.ocaml context in
      ocaml.lib_config
    in
    let instrument_with = Context.instrument_with context in
    let+ public_libs =
      let+ installed_libs = Lib.DB.installed context in
      public_libs t ~instrument_with ~lib_config ~installed_libs stanzas
    in
    let public_theories =
      let installed_theories =
        Memo.lazy_
        @@ fun () ->
        let+ coqpaths_of_coq = Coq_path.of_coq_install context
        and+ coqpaths_of_env = Context.installed_env context >>= Coq_path.of_env in
        Coq_lib.DB.create_from_coqpaths (coqpaths_of_env @ coqpaths_of_coq)
      in
      Memo.Lazy.map installed_theories ~f:(fun installed_theories ->
        public_theories ~find_db:(fun _ -> public_libs) ~installed_theories coq_stanzas)
    in
    let by_dir =
      scopes_by_dir
        ~instrument_with
        ~build_dir
        ~lib_config
        ~projects_by_root
        ~public_libs
        ~public_theories
        stanzas
        coq_stanzas
    in
    let value = { by_dir } in
    Fdecl.set t value;
    value, public_libs
  ;;

  let create_from_stanzas ~projects_by_root ~(context : Context_name.t) stanzas =
    let stanzas, coq_stanzas =
      Dune_file.fold_static_stanzas
        stanzas
        ~init:([], [])
        ~f:(fun dune_file stanza (acc, coq_acc) ->
          let build_dir = Context_name.build_dir context in
          match Stanza.repr stanza with
          | Library.T lib ->
            let ctx_dir = Path.Build.append_source build_dir (Dune_file.dir dune_file) in
            Library_related_stanza.Library (ctx_dir, lib) :: acc, coq_acc
          | Deprecated_library_name.T d ->
            let ctx_dir = Path.Build.append_source build_dir (Dune_file.dir dune_file) in
            Deprecated_library_name (ctx_dir, d) :: acc, coq_acc
          | Library_redirect.Local.T d ->
            let ctx_dir = Path.Build.append_source build_dir (Dune_file.dir dune_file) in
            Library_redirect (ctx_dir, d) :: acc, coq_acc
          | Coq_stanza.Theory.T coq_lib ->
            let ctx_dir = Path.Build.append_source build_dir (Dune_file.dir dune_file) in
            acc, (ctx_dir, coq_lib) :: coq_acc
          | _ -> acc, coq_acc)
    in
    create ~projects_by_root ~context stanzas coq_stanzas
  ;;

  let all =
    Per_context.create_by_name ~name:"scope" (fun context ->
      Memo.Lazy.create (fun () ->
        let* projects_by_root = Dune_load.projects_by_root ()
        and* stanzas = Dune_load.dune_files context in
        create_from_stanzas ~projects_by_root ~context stanzas)
      |> Memo.Lazy.force)
    |> Staged.unstage
  ;;

  let create_from_stanzas (context : Context_name.t) = all context

  let with_all context ~f =
    let+ scopes, _ = create_from_stanzas (Context.name context) in
    let find = find_by_project scopes in
    f find
  ;;

  let public_libs context =
    let+ _, public_libs = create_from_stanzas context in
    public_libs
  ;;

  let find_by_dir dir =
    let* context = Context.DB.by_dir dir in
    let+ scopes, _ = create_from_stanzas (Context.name context) in
    find_by_dir scopes dir
  ;;

  let find_by_project context project =
    let+ scopes, _ = create_from_stanzas context in
    find_by_project scopes project
  ;;

  module Lib_entry = struct
    type t =
      | Library of Library.Id.t * Lib.Local.t
      | Deprecated_library_name of Deprecated_library_name.t

    let name = function
      | Library (_, lib) -> Lib.Local.to_lib lib |> Lib.name
      | Deprecated_library_name { old_name = old_public_name, _; _ } ->
        Public_lib.name old_public_name
    ;;
  end

  let lib_entries_of_package =
    let make_map build_dir public_libs stanzas =
      let+ libs =
        Dune_file.Memo_fold.fold_static_stanzas stanzas ~init:[] ~f:(fun d stanza acc ->
          match Stanza.repr stanza with
          | Library.T ({ visibility = Private (Some pkg); _ } as lib) ->
            let src_dir = Dune_file.dir d in
            let library_id = Library.Id.of_stanza ~src_dir lib in
            let+ lib =
              let* scope = find_by_dir (Path.Build.append_source build_dir src_dir) in
              Lib.DB.find (libs scope) library_id
            in
            (match lib with
             | None -> acc
             | Some lib ->
               let name = Package.name pkg in
               (name, Lib_entry.Library (library_id, Lib.Local.of_lib_exn lib)) :: acc)
          | Library.T ({ visibility = Public pub; _ } as conf) ->
            let library_id =
              let src_dir = Dune_file.dir d in
              Library.Id.of_stanza ~src_dir conf
            in
            let* lib = Lib.DB.find_stanza_id public_libs (Public_lib.name pub) in
            (match lib with
             | None ->
               (* Skip hidden or unavailable libraries. TODO we should assert
                  that the library name is always found somehow *)
               Memo.return acc
             | Some lib_id ->
               let+ lib = Lib.DB.find public_libs lib_id in
               (match lib with
                | None -> acc
                | Some lib ->
                  let package = Public_lib.package pub in
                  let name = Package.name package in
                  let local_lib = Lib.Local.of_lib_exn lib in
                  (name, Lib_entry.Library (library_id, local_lib)) :: acc))
          | Deprecated_library_name.T ({ old_name = old_public_name, _; _ } as d) ->
            let package = Public_lib.package old_public_name in
            let name = Package.name package in
            Memo.return ((name, Lib_entry.Deprecated_library_name d) :: acc)
          | _ -> Memo.return acc)
      in
      Package.Name.Map.of_list_multi libs
      |> Package.Name.Map.map
           ~f:
             (List.sort ~compare:(fun a b ->
                Lib_name.compare (Lib_entry.name a) (Lib_entry.name b)))
    in
    let per_context =
      Per_context.create_by_name ~name:"scope-db" (fun ctx ->
        Memo.lazy_ (fun () ->
          let* public_libs =
            let* ctx = Context.DB.get ctx in
            public_libs (Context.name ctx)
          and* stanzas = Dune_load.dune_files ctx in
          make_map (Context_name.build_dir ctx) public_libs stanzas)
        |> Memo.Lazy.force)
      |> Staged.unstage
    in
    fun (ctx : Context_name.t) pkg_name ->
      let+ map = per_context ctx in
      Package.Name.Map.Multi.find map pkg_name
  ;;
end
