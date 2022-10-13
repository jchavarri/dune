type t =
  | Ocaml of Ocaml.Mode.t
  | Melange

module Cm_kind = struct
  type t =
    | Ocaml of Ocaml.Cm_kind.t
    | Melange of Melange.Cm_kind.t

  let choose ocaml melange = function
    | Ocaml k -> ocaml k
    | Melange k -> melange k

  let source = choose Ocaml.Cm_kind.source Melange.Cm_kind.source

  let ext = choose Ocaml.Cm_kind.ext Melange.Cm_kind.ext

  let cmi = function
    | Ocaml _ -> Ocaml Cmi
    | Melange _ -> Melange Cmi

  let to_dyn =
    let open Dyn in
    function
    | Ocaml k -> variant "ocaml" [ Ocaml.Cm_kind.to_dyn k ]
    | Melange k -> variant "melange" [ Melange.Cm_kind.to_dyn k ]

  module Dict = struct
    type 'a t =
      { ocaml : 'a Ocaml.Cm_kind.Dict.t
      ; melange : 'a Melange.Cm_kind.Dict.t
      }

    let get t = function
      | Ocaml k -> Ocaml.Cm_kind.Dict.get t.ocaml k
      | Melange k -> (
        match k with
        | Cmi -> t.melange.cmi
        | Cmj -> t.melange.cmj)

    let make_all x =
      { ocaml = Ocaml.Cm_kind.Dict.make_all x
      ; melange = Melange.Cm_kind.Dict.make_all x
      }
  end
end

let equal x y =
  match (x, y) with
  | Ocaml a, Ocaml b -> Ocaml.Mode.equal a b
  | Melange, Melange -> true
  | Ocaml _, Melange | Melange, Ocaml _ -> false

let choose ocaml melange = function
  | Ocaml m -> ocaml m
  | Melange -> melange

let to_string = choose Ocaml.Mode.to_string "melange"

let decode =
  let open Dune_sexp.Decoder in
  enum [ ("byte", Ocaml Byte); ("native", Ocaml Native); ("melange", Melange) ]

let of_cm_kind : Cm_kind.t -> t = function
  | Ocaml (Cmi | Cmo) -> Ocaml Byte
  | Ocaml Cmx -> Ocaml Native
  | Melange (Cmi | Cmj) -> Melange

module Dict = struct
  type 'a t =
    { ocaml : 'a Ocaml.Mode.Dict.t
    ; melange : 'a
    }

  let equal f { ocaml; melange } t : bool =
    Ocaml.Mode.Dict.equal f ocaml t.ocaml && f melange t.melange

  let to_dyn to_dyn { ocaml; melange } =
    let open Dyn in
    record
      [ ("ocaml", Ocaml.Mode.Dict.to_dyn to_dyn ocaml)
      ; ("melange", to_dyn melange)
      ]

  let map t ~f =
    { ocaml = Ocaml.Mode.Dict.map ~f t.ocaml; melange = f t.melange }

  module Set = struct
    type nonrec t = bool t

    let equal = equal Bool.equal

    let to_dyn { ocaml; melange } =
      let open Dyn in
      record
        [ ("ocaml", Ocaml.Mode.Dict.Set.to_dyn ocaml)
        ; ("melange", bool melange)
        ]
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
         and+ melange =
           field ~default:[] "melange"
             (Dune_lang.Syntax.since Melange.melange_syntax (0, 1) >>> repeat f)
         in
         { ocaml = { byte; native }; melange })
  end
end
