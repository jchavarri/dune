let config =
  Route_config.
    {
      kind = API (React_app Any_non_admin);
      sensitivity = Sensitivity.Sensitive;
      allowed_methods = GET_or_POST;
    }
