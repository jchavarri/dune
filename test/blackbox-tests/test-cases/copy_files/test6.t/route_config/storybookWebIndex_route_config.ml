let config =
  Route_config.
    {
      kind = Web Any_non_admin;
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = POST_only;
    }
