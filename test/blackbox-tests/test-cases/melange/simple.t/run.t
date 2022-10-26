Compilation using melange
  $ dune rules lib/.x.objs/melange/x.js
  $ dune build lib/x.js
  $ node ./_build/default/lib/x.js
  buy it

Rebuilding same project (js artifacts are tracked correctly)
  $ dune build lib/x.js
  $ node ./_build/default/x.js
  buy it
