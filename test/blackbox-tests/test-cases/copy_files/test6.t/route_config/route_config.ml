(** Here, we define extra request information that is shared between frontend and backend code.
    The module name is intentionally abstract, so that the contents can be changed with minimal impact
    on esgg code generation.

    Values for this type are assigned to each request in {v backend/api/aa_fe/request/route_config v} or
    {v backend/api/aa_be/request/route_config v} by {v add_endpoint v}, but can be changed manually.
*)

(** {1 Kinds }

    These types control how an endpoint is exposed to the world. *)

(** For a public endpoint — specifies which domains it's published under. *)
type domain_restriction =
  | Root  (** Visible only on [ahrefs.com] *)
  | Admin_dot  (** Visible only on [admin.ahrefs.com] *)
  | App_dot  (** Visible only on [app.ahrefs.com] *)
  | Any_non_admin  (** Visible on both [app.ahrefs.com] {e and} the root of [ahrefs.com] *)
  | Any  (** Visible everywhere i.e [ahrefs.com], [app.ahrefs.com] and [admin.ahrefs.com] *)

(** For an API-endpoint — specifies the visibility of the endpoint; i.e. whether it's mounted under various AA instances (internal-only, user API, React-app ...) *)
type api_kind =
  | Local  (** Only reachable from the same node where AA is running, that don't go thru NginX (e.g. from PHP) *)
  | Internal  (** Only reachable from Ahrefs-owned nodes thru NginX proxy (e.g. from SA) *)
  | V2
      (** Legacy, public, API endpoints (e.g. [positions_metrics]) served thru AA ({{:https://ahrefs.slack.com/archives/C3HDKRPM3/p1657277511718899} Slack thread}) *)
  | V3  (** Endpoints associated with our stable, public ApiV3 (on [api.ahrefs.com]) *)
  | Looker_studio  (** Endpoints used by our Looker Studio connector scripts (on [api.ahrefs.com]) *)
  | React_app of domain_restriction
      (** JSON endpoints publicly visible under [/api/v4]; but unstable — tightly-coupled to our frontend codebase *)

type kind =
  | API of api_kind
  | Web of domain_restriction  (** HTML templates, including those that ship our frontend application to users *)

type allowed_methods =
  | GET_or_POST
  | POST_only

module Sensitivity = struct
  type t =
  | Sensitive
  | Not_sensitive

let to_query_param = function
  | Not_sensitive -> "input"
  | Sensitive -> "sensitive-input"
end

type t = {
  kind : kind;
  sensitivity : Sensitivity.t;  (** If [Sensitive], the query's input should be redacted in logs. *)
  allowed_methods : allowed_methods;
}
