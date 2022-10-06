open! Stdune

type t =
  | Byte
  | Native

let equal x y =
  match (x, y) with
  | Byte, Byte -> true
  | Byte, _ | _, Byte -> false
  | Native, Native -> true

let compare x y =
  match (x, y) with
  | Byte, Byte -> Eq
  | Byte, _ -> Lt
  | _, Byte -> Gt
  | Native, Native -> Eq

let all = [ Byte; Native ]

let choose byte native = function
  | Byte -> byte
  | Native -> native

let compiled_unit_ext = choose (Cm_kind.ext Cmo) (Cm_kind.ext Cmx)

let compiled_lib_ext = choose ".cma" ".cmxa"

let plugin_ext = choose ".cma" ".cmxs"

let variant = choose Variant.byte Variant.native

let cm_kind = choose Cm_kind.Cmo Cmx

let exe_ext = choose ".bc" ".exe"

let of_cm_kind : Cm_kind.t -> t = function
  | Cmi | Cmo -> Byte
  | Cmx -> Native

module Dict = struct
  let mode_equal = equal

  type 'a t =
    { byte : 'a
    ; native : 'a
    }

  let equal f { byte; native } t = f byte t.byte && f native t.native

  let for_all { byte; native } ~f = f byte && f native

  let get t = function
    | Byte -> t.byte
    | Native -> t.native

  let of_func f = { byte = f ~mode:Byte; native = f ~mode:Native }

  let map2 a b ~f = { byte = f a.byte b.byte; native = f a.native b.native }

  let map t ~f = { byte = f t.byte; native = f t.native }

  let mapi t ~f = { byte = f Byte t.byte; native = f Native t.native }

  let iteri t ~f =
    f Byte t.byte;
    f Native t.native

  let make_both x = { byte = x; native = x }

  let make ~byte ~native = { byte; native }

  module Set = struct
    type nonrec t = bool t

    let equal = equal Bool.equal

    let all = { byte = true; native = true }

    let to_list t =
      let l = [] in
      let l = if t.native then Native :: l else l in
      let l = if t.byte then Byte :: l else l in
      l

    let of_list l =
      { byte = List.mem l Byte ~equal:mode_equal
      ; native = List.mem l Native ~equal:mode_equal
      }

    let is_empty t = not (t.byte || t.native)

    let iter_concurrently t ~f =
      let open Memo.O in
      let+ () = Memo.when_ t.byte (fun () -> f Byte)
      and+ () = Memo.when_ t.native (fun () -> f Native) in
      ()
  end

  module List = struct
    type nonrec 'a t = 'a list t

    let empty = { byte = []; native = [] }
  end
end
