let config =
  Route_config.
    {
      kind = API (React_app Root);
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = GET_or_POST;
    }
