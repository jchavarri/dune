let config =
  Route_config.
    {
      kind = API (React_app App_dot);
      sensitivity = Sensitivity.Sensitive;
      allowed_methods = GET_or_POST;
    }
