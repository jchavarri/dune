(** ocamldep management *)

open Import

module Modules_data : sig
  type library_dep =
    { (* `Some` if the lib has an entry ml-gen module (which will be needed to pass -map flag to ocamldep *)
      needs_map_module : Module.File.t option
    ; (* The lib modules *)
      modules : Modules.With_vlib.t
    }

  (** Various information needed about a set of modules.

      This is a subset of [Compilation_context]. We don't use
      [Compilation_context] directory as this would create a circular
      dependency. *)
  type t =
    { dir : Path.Build.t
    ; obj_dir : Path.Build.t Obj_dir.t
    ; sctx : Super_context.t
    ; vimpl : Vimpl.t option
    ; modules : Modules.With_vlib.t
    ; stdlib : Ocaml_stdlib.t option
    ; sandbox : Sandbox_config.t
    ; library_deps : library_dep list
    }
end

val deps_of
  :  Modules_data.t
  -> ml_kind:Ml_kind.t
  -> Module.t
  -> Module.t list Action_builder.t Memo.t

val read_deps_of
  :  obj_dir:Path.Build.t Obj_dir.t
  -> modules:Modules.With_vlib.t
  -> ml_kind:Ml_kind.t
  -> Module.t
  -> Module.t list Action_builder.t

(** [read_immediate_deps_of ~obj_dir ~modules ~ml_kind unit] returns the
    immediate dependencies found in the modules of [modules] for the file with
    kind [ml_kind] of the module [unit]. If there is no such file with kind
    [ml_kind], then an empty list of dependencies is returned. *)
val read_immediate_deps_of
  :  obj_dir:Path.Build.t Obj_dir.t
  -> modules:Modules.With_vlib.t
  -> ml_kind:Ml_kind.t
  -> Module.t
  -> Module.t list Action_builder.t
