open! Stdune
open Ocaml

type t =
  | Ocaml of Mode.t
  | Melange

let equal x y =
  match (x, y) with
  | Ocaml a, Ocaml b -> Mode.equal a b
  | Melange, Melange -> true
  | Ocaml _, Melange | Melange, Ocaml _ -> false

let choose ocaml melange = function
  | Ocaml m -> ocaml m
  | Melange -> melange

let to_string = choose Mode.to_string "melange_experimental"

let encode t = Dune_sexp.Encoder.string (to_string t)

let decode =
  let open Dune_sexp.Decoder in
  enum
    [ ("byte", Ocaml Byte)
    ; ("native", Ocaml Native)
    ; ("melange_experimental", Melange)
    ]

let of_cm_kind : Cm_kind.t -> t = function
  | Cmi | Cmo -> Ocaml Byte
  | Cmx -> Ocaml Native

module Dict = struct
  let libmode_equal = equal

  type 'a t =
    { ocaml : 'a Mode.Dict.t
    ; melange : 'a
    }

  let equal f { ocaml; melange } t : bool =
    Mode.Dict.equal f ocaml t.ocaml && f melange t.melange

  let to_dyn to_dyn { ocaml; melange } =
    let open Dyn in
    record
      [ ("ocaml", Mode.Dict.to_dyn to_dyn ocaml); ("melange", to_dyn melange) ]

  let map t ~f = { ocaml = Mode.Dict.map ~f t.ocaml; melange = f t.melange }

  module Set = struct
    type nonrec t = bool t

    let equal = equal Bool.equal

    let to_dyn { ocaml; melange } =
      let open Dyn in
      record
        [ ("ocaml", Mode.Dict.Set.to_dyn ocaml); ("melange", bool melange) ]

    let to_list t =
      let l = List.map ~f:(fun m -> Ocaml m) (Mode.Dict.Set.to_list t.ocaml) in
      l

    let of_list l =
      let ocaml = List.filter_map ~f:(choose Option.some None) l in
      { ocaml = Mode.Dict.Set.of_list ocaml
      ; melange = List.mem l Melange ~equal:libmode_equal
      }

    let encode t = List.map ~f:encode (to_list t)
  end

  module List = struct
    type nonrec 'a t = 'a list t

    let encode f { ocaml; melange } =
      let open Dune_sexp.Encoder in
      record_fields
        [ field_l "byte" f ocaml.byte
        ; field_l "native" f ocaml.native
        ; field_l "melange" f melange
        ]

    let decode f =
      let open Dune_sexp.Decoder in
      fields
        (let+ byte = field ~default:[] "byte" (repeat f)
         and+ native = field ~default:[] "native" (repeat f)
         and+ melange = field ~default:[] "melange" (repeat f) in
         { ocaml = { byte; native }; melange })
  end
end
