let config =
  Route_config.
    {
      kind = Web App_dot;
      sensitivity = Sensitivity.Not_sensitive;
      allowed_methods = POST_only;
      (* target is not used for this web endpoint, check routes in endpoint ml file *)
    }
