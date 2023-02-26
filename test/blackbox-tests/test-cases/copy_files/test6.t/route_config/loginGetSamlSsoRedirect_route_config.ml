let config =
  Route_config.
    {
      kind = API (React_app Any_non_admin);
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = POST_only;
    }
