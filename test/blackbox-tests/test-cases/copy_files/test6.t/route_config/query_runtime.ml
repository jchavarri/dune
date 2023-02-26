type ('input, 'output) request = {
  name : string;
  input_of_string : string -> 'input;
  string_of_input : 'input -> string;
  string_of_output : 'output -> string;
  config : Route_config.t;
}
