let config =
  Route_config.
    {
      kind = API (React_app Root);
      sensitivity = Sensitivity.Sensitive;
      allowed_methods = POST_only;
    }
