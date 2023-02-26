let config =
  Route_config.
    {
      kind = API (React_app Admin_dot);
      sensitivity = Sensitivity.Sensitive;
      allowed_methods = POST_only;
    }
