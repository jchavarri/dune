Melange public library depends on private library

  $ cat > dune-project <<EOF
  > (lang dune 3.8)
  > (package (name foo))
  > (using melange 0.1)
  > EOF

  $ mkdir -p priv
  $ cat > priv/dune <<EOF
  > (library
  >  (name priv)
  >  (package foo)
  >  (modes melange))
  > EOF
  $ cat > priv/priv.ml <<EOF
  > let x = "private"
  > EOF

  $ mkdir -p lib
  $ cat > lib/dune <<EOF
  > (library
  >  (public_name foo)
  >  (modes melange)
  >  (libraries priv))
  > EOF
  $ cat > lib/foo.ml <<EOF
  > let x = "public lib uses " ^ Priv.x
  > EOF

  $ cat > dune <<EOF
  > (melange.emit
  >  (target output)
  >  (libraries foo)
  >  (emit_stdlib false))
  > EOF

  $ cat > entry.ml <<EOF
  > let () = Js.log Foo.x
  > EOF

  $ dune build @melange

  $ node _build/default/output/entry.js
  public lib uses private

  $ cat _build/default/output/node_modules/foo/foo.js
  // Generated by Melange
  'use strict';
  
  let Priv = require("foo.__private__.priv/priv.js");
  
  const x = "public lib uses " + Priv.x;
  
  exports.x = x;
  /* No side effect */

