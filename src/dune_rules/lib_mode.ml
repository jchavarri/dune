type t =
  | Ocaml of Ocaml.Mode.t
  | Melange

let decode =
  let open Dune_sexp.Decoder in
  enum [ ("byte", Ocaml Byte); ("native", Ocaml Native); ("melange", Melange) ]
