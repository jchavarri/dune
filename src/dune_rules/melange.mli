val melange_syntax : Dune_lang.Syntax.t

module Cm_kind : sig
  type t =
    | Cmi
    | Cmj

  val source : t -> Ocaml.Ml_kind.t

  val ext : t -> string

  val to_dyn : t -> Dyn.t

  module Dict : sig
    type 'a t =
      { cmi : 'a
      ; cmj : 'a
      }

    val make_all : 'a -> 'a t
  end
end
