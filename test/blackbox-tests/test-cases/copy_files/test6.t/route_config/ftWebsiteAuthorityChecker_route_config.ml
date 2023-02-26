let config =
  Route_config.
    {
      kind = API (React_app Root);
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = POST_only;
    }
