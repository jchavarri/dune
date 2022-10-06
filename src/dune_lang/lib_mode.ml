open! Stdune
open Ocaml

type t = Ocaml of Mode.t

let equal x y =
  match (x, y) with
  | Ocaml a, Ocaml b -> Mode.equal a b

let compare x y =
  match (x, y) with
  | Ocaml a, Ocaml b -> Mode.compare a b

let all = List.map ~f:(fun m -> Ocaml m) Mode.all

let choose ocaml = function
  | Ocaml m -> ocaml m

let compiled_lib_ext = choose Mode.compiled_lib_ext

let plugin_ext = choose Mode.plugin_ext

let to_string = function
  | Ocaml Byte -> "byte"
  | Ocaml Native -> "native"

let encode t = Dune_sexp.Encoder.string (to_string t)

let to_dyn t = Dyn.variant (to_string t) []

let decode =
  let open Dune_sexp.Decoder in
  enum [ ("byte", Ocaml Byte); ("native", Ocaml Native) ]

let variant = choose Mode.variant

let cm_kind = choose Mode.cm_kind

module Dict = struct
  type 'a t = { ocaml : 'a Mode.Dict.t }

  let equal f { ocaml } t : bool = Mode.Dict.equal f ocaml t.ocaml

  let to_dyn to_dyn { ocaml } =
    let open Dyn in
    record [ ("byte", to_dyn ocaml.byte); ("native", to_dyn ocaml.native) ]

  let get t = function
    | Ocaml m -> Mode.Dict.get t.ocaml m

  let of_func f =
    { ocaml = Mode.Dict.of_func (fun ~mode -> f ~mode:(Ocaml mode)) }

  let map2 a b ~f = { ocaml = Mode.Dict.map2 a.ocaml b.ocaml ~f }

  let map t ~f = { ocaml = Mode.Dict.map ~f t.ocaml }

  let make_all x = { ocaml = { byte = x; native = x } }

  let make ~byte ~native = { ocaml = { byte; native } }

  module Set = struct
    type nonrec t = bool t

    let equal = equal Bool.equal

    let to_dyn { ocaml } =
      let open Dyn in
      record [ ("byte", bool ocaml.byte); ("native", bool ocaml.native) ]

    let all = { ocaml = Mode.Dict.Set.all }

    let to_list t =
      let l = List.map ~f:(fun m -> Ocaml m) (Mode.Dict.Set.to_list t.ocaml) in
      l

    let of_list l =
      let ocaml =
        List.filter_map
          ~f:(function
            | Ocaml o -> Some o)
          l
      in
      { ocaml = Mode.Dict.Set.of_list ocaml }

    let encode t = List.map ~f:encode (to_list t)

    let is_empty t = Mode.Dict.Set.is_empty t.ocaml
  end

  module List = struct
    type nonrec 'a t = 'a list t

    let empty = { ocaml = Mode.Dict.List.empty }

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
