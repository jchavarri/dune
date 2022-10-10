open Ocaml

type t =
  | Ocaml of Mode.t
  | Melange

val equal : t -> t -> bool

val decode : t Dune_sexp.Decoder.t

val to_string : t -> string

val of_cm_kind : Cm_kind.t -> t

module Dict : sig
  type mode = t

  type 'a t =
    { ocaml : 'a Mode.Dict.t
    ; melange : 'a
    }

  val to_dyn : ('a -> Dyn.t) -> 'a t -> Dyn.t

  module List : sig
    type 'a dict

    type 'a t = 'a list dict

    val decode : 'a Dune_sexp.Decoder.t -> 'a t Dune_sexp.Decoder.t

    val encode : 'a Dune_sexp.Encoder.t -> 'a t -> Dune_sexp.t list
  end
  with type 'a dict := 'a t

  val map : 'a t -> f:('a -> 'b) -> 'b t

  module Set : sig
    type nonrec t = bool t

    val to_dyn : t -> Dyn.t

    val encode : t -> Dune_sexp.t list

    val equal : t -> t -> bool

    val of_list : mode list -> t
  end
end
with type mode := t
