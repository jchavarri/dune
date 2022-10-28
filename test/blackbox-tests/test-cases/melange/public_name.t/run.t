Compilation using melange
  $ dune build public_name/lib/x.js
  $ node ./_build/default/public_name/lib/x.js
  buy it

Rebuilding same project (js artifacts are tracked correctly)
  $ dune build public_name/lib/x.js
  $ node ./_build/default/public_name/lib/x.js
  buy it
