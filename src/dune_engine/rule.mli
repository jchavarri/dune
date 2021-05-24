(** Representation of rules *)

open! Stdune
open! Import

module Info : sig
  type t =
    | From_dune_file of Loc.t
    | Internal
    | Source_file_copy of Path.Source.t

  val of_loc_opt : Loc.t option -> t
end

module Promote : sig
  module Lifetime : sig
    type t =
      | Unlimited  (** The promoted file will be deleted by [dune clean] *)
      | Until_clean
  end

  module Into : sig
    type t =
      { loc : Loc.t
      ; dir : string
      }
  end

  type t =
    { lifetime : Lifetime.t
    ; into : Into.t option
    ; only : Predicate_lang.Glob.t option
    }
end

module Mode : sig
  type t =
    | Standard
    | Fallback  (** Only use this rule if the source files don't exist. *)
    | Promote of Promote.t
        (** Silently promote the targets to the source tree. *)
    | Ignore_source_files
        (** Just ignore the source files entirely. This is for cases where the
            targets are promoted only in a specific context, such as for
            .install files. *)
end

module Id : sig
  type t

  val compare : t -> t -> Ordering.t

  module Map : Map.S with type key = t

  module Set : Set.S with type elt = t
end

type t = private
  { id : Id.t
  ; context : Build_context.t option
  ; targets : Path.Build.Set.t
  ; action : Action.Full.t Action_builder.t
  ; mode : Mode.t
  ; info : Info.t
  ; loc : Loc.t
  ; (* Directory where all the targets are produced. *) dir : Path.Build.t
  }

module Set : Set.S with type elt = t

val equal : t -> t -> bool

val hash : t -> int

val to_dyn : t -> Dyn.t

val make :
     ?sandbox:Sandbox_config.t
  -> ?mode:Mode.t
  -> context:Build_context.t option
  -> ?info:Info.t
  -> targets:Path.Build.Set.t
  -> Action.Full.t Action_builder.t
  -> t

val with_prefix : t -> build:unit Action_builder.t -> t

val loc : t -> Loc.t

(** [find_source_dir rule] is the closest source directory corresponding to
    rule.dir. Eg. [src/dune] for a rule with dir
    [_build/default/src/dune/.dune.objs]. *)
val find_source_dir : t -> Source_tree.Dir.t Memo.Build.t
