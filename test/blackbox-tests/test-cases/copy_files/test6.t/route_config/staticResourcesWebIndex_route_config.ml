let config =
  Route_config.
    {
      kind = Web Any;
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = GET_or_POST;
    }
