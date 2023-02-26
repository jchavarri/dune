let config =
  Route_config.
    {
      kind = Web Root;
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = GET_or_POST;
      (* target is not used for this web endpoint, check routes in endpoint ml file *)
    }
