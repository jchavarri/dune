open Stdune
open Dune_xxh

type t = string

module Set = String.Set
module Map = String.Map
module Metrics = Dune_metrics

module type Digest_impl = sig
  val file : string -> t
  val string : string -> t
end

module Direct_impl : Digest_impl = struct
  let file f =
    let f = Unix.openfile f [ O_RDONLY ] 0 in
    try
      let res = Xxh.XXH3_128bits.file f in
      Unix.close f;
      res
    with
    | exn ->
      let exn = Exn_with_backtrace.capture exn in
      Unix.close f;
      Exn_with_backtrace.reraise exn
  ;;

  let string s = Xxh.XXH3_128bits.string s
end

module Mutable_impl = struct
  let file_ref = ref Direct_impl.file
  let string_ref = ref Direct_impl.string
  let file f = !file_ref f
  let string s = !string_ref s
end

let override_impl ~file ~string =
  Mutable_impl.file_ref := file;
  Mutable_impl.string_ref := string
;;

module Impl : Digest_impl = Mutable_impl

let hash = Poly.hash
let equal = String.equal
let file p = Impl.file (Path.to_string p)
let compare = String.compare
let to_string = Stdlib.Digest.to_hex
let to_dyn s = Dyn.variant "digest" [ String (to_string s) ]

let from_hex s =
  match Stdlib.Digest.from_hex s with
  | s -> Some s
  | exception Invalid_argument _ -> None
;;

let string = Impl.string
let to_string_raw s = s

(* We use [No_sharing] to avoid generating different digests for inputs that
   differ only in how they share internal values. Without [No_sharing], if a
   command line contains duplicate flags, such as multiple occurrences of the
   flag [-I], then [Marshal.to_string] will produce different digests depending
   on whether the corresponding strings ["-I"] point to the same memory location
   or to different memory locations. *)
let generic a =
  Metrics.Timer.record "generic_digest" ~f:(fun () ->
    string (Marshal.to_string a [ No_sharing ]))
;;

let path_with_executable_bit =
  (* We follow the digest scheme used by Jenga. *)
  let string_and_bool ~digest_hex ~bool =
    Impl.string (digest_hex ^ if bool then "\001" else "\000")
  in
  fun ~executable ~content_digest ->
    string_and_bool ~digest_hex:content_digest ~bool:executable
;;

let file_with_executable_bit ~executable path =
  let content_digest = file path in
  path_with_executable_bit ~content_digest ~executable
;;

module Stats_for_digest = struct
  type t =
    { st_kind : Unix.file_kind
    ; st_perm : Unix.file_perm
    }

  let of_unix_stats (stats : Unix.stats) =
    { st_kind = stats.st_kind; st_perm = stats.st_perm }
  ;;
end

module Path_digest_error = struct
  type nonrec t =
    | Unexpected_kind
    | Unix_error of Dune_filesystem_stubs.Unix_error.Detailed.t
end

exception E of Path_digest_error.t

let directory_digest_version = 3

let path_with_stats ~allow_dirs path (stats : Stats_for_digest.t) =
  let rec loop path (stats : Stats_for_digest.t) =
    match stats.st_kind with
    | S_LNK ->
      let executable = Path.Permissions.test Path.Permissions.execute stats.st_perm in
      Dune_filesystem_stubs.Unix_error.Detailed.catch
        (fun path ->
          let contents = Unix.readlink (Path.to_string path) in
          path_with_executable_bit ~executable ~content_digest:contents)
        path
      |> Result.map_error ~f:(fun x -> Path_digest_error.Unix_error x)
    | S_REG ->
      let executable = Path.Permissions.test Path.Permissions.execute stats.st_perm in
      Dune_filesystem_stubs.Unix_error.Detailed.catch
        (file_with_executable_bit ~executable)
        path
      |> Result.map_error ~f:(fun x -> Path_digest_error.Unix_error x)
    | S_DIR when allow_dirs ->
      (* CR-someday amokhov: The current digesting scheme has collisions for files
         and directories. It's unclear if this is actually a problem. If it turns
         out to be a problem, we should include [st_kind] into both digests. *)
      (match Path.readdir_unsorted path with
       | Error e -> Error (Path_digest_error.Unix_error e)
       | Ok listing ->
         (match
            List.rev_map listing ~f:(fun name ->
              let path = Path.relative path name in
              let stats =
                match Path.lstat path with
                | Error e -> raise_notrace (E (Unix_error e))
                | Ok stat -> Stats_for_digest.of_unix_stats stat
              in
              let digest =
                match loop path stats with
                | Ok s -> s
                | Error e -> raise_notrace (E e)
              in
              name, digest)
            |> List.sort ~compare:(fun (x, _) (y, _) -> String.compare x y)
          with
          | exception E e -> Error e
          | contents -> Ok (generic (directory_digest_version, contents, stats.st_perm))))
    | S_DIR | S_BLK | S_CHR | S_FIFO | S_SOCK -> Error Unexpected_kind
  in
  match stats.st_kind with
  | S_DIR when not allow_dirs -> Error Path_digest_error.Unexpected_kind
  | S_BLK | S_CHR | S_LNK | S_FIFO | S_SOCK -> Error Unexpected_kind
  | _ -> loop path stats
;;
