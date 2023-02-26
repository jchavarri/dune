let config =
  Route_config.
    {
      kind = API (React_app App_dot);
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = POST_only;
    }
