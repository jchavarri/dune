Compilation using melange with a library
The library in the test includes tens of files to make sure cmjs are read after they are written.
  $ dune build
  $ node ./_build/default/x/.x.objs/byte/x__M_2_1_1_1.js
  done
