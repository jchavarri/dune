type t =
  | Ocaml of Ocaml.Mode.t
  | Melange

val decode : t Dune_sexp.Decoder.t
