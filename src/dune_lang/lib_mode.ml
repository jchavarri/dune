open! Stdune
open Ocaml

type t = Ocaml of Mode.t

let equal x y =
  match (x, y) with
  | Ocaml a, Ocaml b -> Mode.equal a b

let choose ocaml = function
  | Ocaml m -> ocaml m

let to_string = choose Mode.to_string

let encode t = Dune_sexp.Encoder.string (to_string t)

let decode =
  let open Dune_sexp.Decoder in
  enum [ ("byte", Ocaml Byte); ("native", Ocaml Native) ]

let of_cm_kind : Cm_kind.t -> t = function
  | Cmi | Cmo -> Ocaml Byte
  | Cmx -> Ocaml Native

module Dict = struct
  type 'a t = { ocaml : 'a Mode.Dict.t }

  let equal f { ocaml } t : bool = Mode.Dict.equal f ocaml t.ocaml

  let to_dyn to_dyn { ocaml } = Mode.Dict.to_dyn to_dyn ocaml

  let map t ~f = { ocaml = Mode.Dict.map ~f t.ocaml }

  module Set = struct
    type nonrec t = bool t

    let equal = equal Bool.equal

    let to_dyn { ocaml } = Mode.Dict.Set.to_dyn ocaml

    let all = { ocaml = Mode.Dict.Set.all }

    let to_list t =
      let l = List.map ~f:(fun m -> Ocaml m) (Mode.Dict.Set.to_list t.ocaml) in
      l

    let of_list l =
      let ocaml = List.filter_map ~f:(choose Option.some) l in
      { ocaml = Mode.Dict.Set.of_list ocaml }

    let encode t = List.map ~f:encode (to_list t)

    let is_empty t = Mode.Dict.Set.is_empty t.ocaml
  end

  module List = struct
    type nonrec 'a t = 'a list t

    let encode f { ocaml } =
      let open Dune_sexp.Encoder in
      record_fields
        [ field_l "byte" f ocaml.byte; field_l "native" f ocaml.native ]

    let decode f =
      let open Dune_sexp.Decoder in
      fields
        (let+ byte = field ~default:[] "byte" (repeat f)
         and+ native = field ~default:[] "native" (repeat f) in
         { ocaml = { byte; native } })
  end
end
