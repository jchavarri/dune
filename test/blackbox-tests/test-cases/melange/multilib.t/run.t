Compilation using melange with a library
The library in the test includes tens of files to make sure cmjs are read after they are written.
  $ dune build x/.x.objs/melange/x__M_2_1_1_1.js
  $ node ./_build/default/x/.x.objs/melange/x__M_2_1_1_1.js
  done
