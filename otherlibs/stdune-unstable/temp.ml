type what =
  | Dir
  | File

let prng = lazy (Random.State.make_self_init ())

let try_paths n ~dir ~prefix ~suffix ~f =
  assert (n > 0);
  let rec loop n =
    let path =
      let rnd = Random.State.bits (Lazy.force prng) land 0xFFFFFF in
      Path.relative dir (Printf.sprintf "%s%06x%s" prefix rnd suffix)
    in
    if n = 1 then
      f path
    else
      match f path with
      | exception _ -> loop (n - 1)
      | r -> r
  in
  loop n

let tmp_files = ref Path.Set.empty

let tmp_dirs = ref Path.Set.empty

let create_temp_file ?(perms = 0o600) path =
  let file = Path.to_string path in
  Unix.close (Unix.openfile file [ O_WRONLY; Unix.O_CREAT; Unix.O_EXCL ] perms)

let destroy = function
  | Dir -> Path.rm_rf ~allow_external:true
  | File -> Path.unlink_no_err

let create_temp_dir ?perms path =
  let dir = Path.to_string path in
  match Fpath.mkdir_p ?perms dir with
  | Created -> ()
  | Already_exists -> raise (Unix.Unix_error (ENOENT, "mkdir", dir))

let set = function
  | Dir -> tmp_dirs
  | File -> tmp_files

let create ?perms = function
  | Dir -> create_temp_dir ?perms
  | File -> create_temp_file ?perms

let () =
  let iter_and_clear r ~f =
    let tmp = !r in
    r := Path.Set.empty;
    Path.Set.iter tmp ~f
  in
  at_exit (fun () ->
      List.iter [ Dir; File ] ~f:(fun what ->
          let set = set what in
          iter_and_clear set ~f:(destroy what)))

let temp_in_dir ?perms what ~dir ~prefix ~suffix =
  let path =
    let create = create ?perms what in
    try_paths 1000 ~dir ~prefix ~suffix ~f:(fun path ->
        create path;
        path)
  in
  let set = set what in
  set := Path.Set.add !set path;
  path

let create ?perms what ~prefix ~suffix =
  let dir =
    Filename.get_temp_dir_name () |> Path.of_filename_relative_to_initial_cwd
  in
  temp_in_dir ?perms what ~dir ~prefix ~suffix

let destroy what fn =
  destroy what fn;
  let set = set what in
  set := Path.Set.remove !set fn

let clear_dir dir =
  Path.clear_dir dir;
  let remove_from_set ~set =
    set :=
      Path.Set.filter !set ~f:(fun f ->
          let removed =
            (not (Path.equal f dir)) && Path.is_descendant ~of_:dir f
          in
          not removed)
  in
  remove_from_set ~set:tmp_files;
  remove_from_set ~set:tmp_dirs

let temp_path =
  try_paths 1000 ~f:(fun candidate ->
      if Path.exists candidate then raise Exit;
      candidate)

let with_temp_path ~dir ~prefix ~suffix ~f =
  match temp_path ~dir ~prefix ~suffix with
  | exception e -> f (Error e)
  | temp_path ->
    Exn.protect
      ~f:(fun () -> f (Ok temp_path))
      ~finally:(fun () -> Path.unlink_no_err temp_path)
