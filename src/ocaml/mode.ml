open! Stdune

type t =
  | Byte
  | Native
  | Melange

let equal x y =
  match (x, y) with
  | Byte, Byte -> true
  | Native, Native -> true
  | Melange, Melange -> true
  | Byte, _ | _, Byte | Native, Melange | Melange, Native -> false

let compare x y =
  match (x, y) with
  | Byte, Byte -> Eq
  | Native, Native -> Eq
  | Melange, Melange -> Eq
  | Byte, _ -> Lt
  | _, Byte -> Gt
  | Native, Melange -> Lt
  | Melange, Native -> Gt

let all = [ Byte; Native ]

let decode =
  let open Dune_sexp.Decoder in
  enum [ ("byte", Byte); ("native", Native); ("melange", Melange) ]

let choose byte native melange = function
  | Byte -> byte
  | Native -> native
  | Melange -> melange

let to_string = choose "byte" "native" "melange"

let encode t = Dune_sexp.Encoder.string (to_string t)

let to_dyn t = Dyn.variant (to_string t) []

let compiled_unit_ext =
  choose (Cm_kind.ext Cmo) (Cm_kind.ext Cmx) (Cm_kind.ext Cmj)

let compiled_lib_ext = choose ".cma" ".cmxa" ".cma"

let plugin_ext = choose ".cma" ".cmxs" ".cma"

let variant = choose Variant.byte Variant.native Variant.melange

let cm_kind = choose Cm_kind.Cmo Cmx Cmj

let exe_ext = choose ".bc" ".exe" ".bs.js"

let of_cm_kind : Cm_kind.t -> t = function
  | Cmi | Cmo -> Byte
  | Cmx -> Native
  | Cmj -> Melange

module Dict = struct
  let mode_equal = equal

  type 'a t =
    { byte : 'a
    ; native : 'a
    ; melange : 'a
    }

  let equal f { byte; native; melange } t =
    f byte t.byte && f native t.native && f melange t.melange

  let for_all { byte; native; melange } ~f = f byte && f native && f melange

  let to_dyn to_dyn { byte; native; melange } =
    let open Dyn in
    record
      [ ("byte", to_dyn byte)
      ; ("native", to_dyn native)
      ; ("melange", to_dyn melange)
      ]

  let get t = function
    | Byte -> t.byte
    | Native -> t.native
    | Melange -> t.melange

  let of_func f =
    { byte = f ~mode:Byte; native = f ~mode:Native; melange = f ~mode:Melange }

  let map2 a b ~f =
    { byte = f a.byte b.byte
    ; native = f a.native b.native
    ; melange = f a.melange b.melange
    }

  let map t ~f = { byte = f t.byte; native = f t.native; melange = f t.melange }

  let mapi t ~f =
    { byte = f Byte t.byte
    ; native = f Native t.native
    ; melange = f Melange t.melange
    }

  let iteri t ~f =
    f Byte t.byte;
    f Native t.native;
    f Melange t.melange

  let make_all x = { byte = x; native = x; melange = x }

  let make ~byte ~native ~melange = { byte; native; melange }

  module Set = struct
    type nonrec t = bool t

    let equal = equal Bool.equal

    let to_dyn { byte; native; melange } =
      let open Dyn in
      record
        [ ("byte", bool byte)
        ; ("native", bool native)
        ; ("melange", bool melange)
        ]

    let all = { byte = true; native = true; melange = true }

    let to_list t =
      let l = [] in
      let l = if t.native then Native :: l else l in
      let l = if t.byte then Byte :: l else l in
      let l = if t.melange then Melange :: l else l in
      l

    let of_list l =
      { byte = List.mem l Byte ~equal:mode_equal
      ; native = List.mem l Native ~equal:mode_equal
      ; melange = List.mem l Melange ~equal:mode_equal
      }

    let encode t = List.map ~f:encode (to_list t)

    let is_empty t = not (t.byte || t.native || t.melange)

    let iter_concurrently t ~f =
      let open Memo.O in
      let+ () = Memo.when_ t.byte (fun () -> f Byte)
      and+ () = Memo.when_ t.native (fun () -> f Native)
      and+ () = Memo.when_ t.melange (fun () -> f Melange) in
      ()
  end

  module List = struct
    type nonrec 'a t = 'a list t

    let empty = { byte = []; native = []; melange = [] }

    let encode f { byte; native; melange } =
      let open Dune_sexp.Encoder in
      record_fields
        [ field_l "byte" f byte
        ; field_l "native" f native
        ; field_l "melange" f melange
        ]

    let decode f =
      let open Dune_sexp.Decoder in
      fields
        (let+ byte = field ~default:[] "byte" (repeat f)
         and+ native = field ~default:[] "native" (repeat f)
         and+ melange = field ~default:[] "melange" (repeat f) in
         { byte; native; melange })
  end
end
