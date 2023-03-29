open Stdune

(** General dune configuration library for non user facing configuration.

    The configuration available through this module is non user facing and is
    subject to change without warning. *)

(** A configuration value. All configuration values have a name and can be
    configured with the environment variable "DUNE_CONFIG__$name" where [$name]
    is the configuration option's name in uppercase *)
type 'a t

module Toggle : sig
  type t =
    [ `Enabled
    | `Disabled
    ]
end

(** [get t] return the value of the configuration for [t] *)
val get : 'a t -> 'a

(** should dune acquire the global lock before building *)
val global_lock : Toggle.t t

(** whether dune should add cutoff to various memoized functions where it
    reduces concurrency *)
val cutoffs_that_reduce_concurrency_in_watch_mode : Toggle.t t

(** Before any configuration value is accessed, this function must be called
    with all the configuration values from the relevant config file
    ([dune-workspace], or [dune-config]).

    Note that environment variables take precedence over the values passed here
    for easy overriding. *)

val init : (Loc.t * string) String.Map.t -> unit
