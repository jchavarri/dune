open Ocaml

type t = Ocaml of Mode.t

val equal : t -> t -> bool

val compare : t -> t -> Ordering.t

val all : t list

val compiled_lib_ext : t -> string

val decode : t Dune_sexp.Decoder.t

val variant : t -> Variant.t

val to_string : t -> string

val to_dyn : t -> Dyn.t

val of_cm_kind : Cm_kind.t -> t

module Dict : sig
  type mode = t

  type 'a t = { ocaml : 'a Mode.Dict.t }

  val equal : ('a -> 'a -> bool) -> 'a t -> 'a t -> bool

  val to_dyn : ('a -> Dyn.t) -> 'a t -> Dyn.t

  module List : sig
    type 'a dict

    type 'a t = 'a list dict

    val empty : 'a t

    val decode : 'a Dune_sexp.Decoder.t -> 'a t Dune_sexp.Decoder.t

    val encode : 'a Dune_sexp.Encoder.t -> 'a t -> Dune_sexp.t list
  end
  with type 'a dict := 'a t

  val get : 'a t -> mode -> 'a

  val of_func : (mode:mode -> 'a) -> 'a t

  val map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t

  val map : 'a t -> f:('a -> 'b) -> 'b t

  val make_all : 'a -> 'a t

  val make : byte:'a -> native:'a -> 'a t

  module Set : sig
    type nonrec t = bool t

    val to_dyn : t -> Dyn.t

    val encode : t -> Dune_sexp.t list

    val equal : t -> t -> bool

    val all : t

    val is_empty : t -> bool

    val of_list : mode list -> t
  end
end
with type mode := t
