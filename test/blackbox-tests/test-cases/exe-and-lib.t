Comparison of exe+lib builds betweeen dune and o2

  $ mkdir exe lib

  $ cat > dune-project <<EOF
  > (lang dune 3.16)
  > EOF

  $ cat > exe/dune <<EOF
  > (library
  >  (name main)
  >  (libraries mylib))
  > EOF

  $ cat > exe/main.ml <<EOF
  > let () = print_endline ("Result: " ^ string_of_int (Mylib.Foo.v))
  > EOF

  $ cat > exe/foo.ml <<EOF
  > let v = 1
  > EOF

  $ cat > lib/dune <<EOF
  > (library
  >  (name mylib))
  > EOF

  $ cat > lib/foo.ml <<EOF
  > let v = 3
  > EOF
  $ cat > lib/bar.ml <<EOF
  > let v = 3
  > EOF

  $ dune build --verbose 2>&1 | grep "Running"
  Running[1]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -bin-annot -I exe/.main.objs/byte -no-alias-deps -opaque -o exe/.main.objs/byte/main__.cmo -c -impl exe/main__.ml-gen)
  Running[2]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamldep.opt -modules -ml-synonym .ml-gen -impl lib/bar.ml) > _build/default/lib/.mylib.objs/mylib__Bar.impl.d
  Running[3]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamldep.opt -modules -ml-synonym .ml-gen -impl lib/foo.ml) > _build/default/lib/.mylib.objs/mylib__Foo.impl.d
  Running[4]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamldep.opt -map lib/mylib.ml-gen -modules -ml-synonym .ml-gen -impl exe/main.ml) > _build/default/exe/.main.objs/main.impl.d
  Running[5]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamldep.opt -map lib/mylib.ml-gen -modules -ml-synonym .ml-gen -impl exe/foo.ml) > _build/default/exe/.main.objs/main__Foo.impl.d
  Running[6]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -bin-annot -I lib/.mylib.objs/byte -no-alias-deps -opaque -o lib/.mylib.objs/byte/mylib.cmo -c -impl lib/mylib.ml-gen)
  Running[7]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -I exe/.main.objs/byte -I exe/.main.objs/native -intf-suffix .ml-gen -no-alias-deps -opaque -o exe/.main.objs/native/main__.cmx -c -impl exe/main__.ml-gen)
  Running[8]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I exe/.main.objs/byte -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Main__ -o exe/.main.objs/byte/main__Foo.cmo -c -impl exe/foo.ml)
  Running[9]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml-gen -no-alias-deps -opaque -o lib/.mylib.objs/native/mylib.cmx -c -impl lib/mylib.ml-gen)
  Running[10]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/byte/mylib__Bar.cmo -c -impl lib/bar.ml)
  Running[11]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/byte/mylib__Foo.cmo -c -impl lib/foo.ml)
  Running[12]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -I exe/.main.objs/byte -I exe/.main.objs/native -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Main__ -o exe/.main.objs/native/main__Foo.cmx -c -impl exe/foo.ml)
  Running[13]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/native/mylib__Bar.cmx -c -impl lib/bar.ml)
  Running[14]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/native/mylib__Foo.cmx -c -impl lib/foo.ml)
  Running[15]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -a -o lib/mylib.cma lib/.mylib.objs/byte/mylib.cmo lib/.mylib.objs/byte/mylib__Foo.cmo lib/.mylib.objs/byte/mylib__Bar.cmo)
  Running[16]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -a -o lib/mylib.cmxa lib/.mylib.objs/native/mylib.cmx lib/.mylib.objs/native/mylib__Foo.cmx lib/.mylib.objs/native/mylib__Bar.cmx)
  Running[17]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -shared -linkall -I lib -o lib/mylib.cmxs lib/mylib.cmxa)

  $ dune rules -r
  mylib
  _build/default/lib/mylib.ml-gen
  Here
  sources: _build/default/exe/.main.objs/mylib__Foo.impl.all-deps
  extras: mylib__Foo
  sources: 
  extras: 
  sources: 
  extras: 
  File "exe/.main.objs/_unknown_", line 1, characters 0-0:
  Error: No rule found for exe/.main.objs/mylib__Foo.impl.all-deps
  [1]

  $ cat _build/default/exe/.main.objs/main.impl.d
  exe/main.ml: Mylib Mylib__Foo

  $ cd _build/default && /home/me/code/dune/_opam/bin/ocamldep.opt -modules -impl exe/main.ml
  exe/main.ml: Mylib

  $ cat lib/mylib.ml-gen
  (* generated by dune *)
  
  (** @canonical Mylib.Bar *)
  module Bar = Mylib__Bar
  
  (** @canonical Mylib.Foo *)
  module Foo = Mylib__Foo

  $ ocamldep.opt -modules -map lib/mylib.ml-gen -impl exe/main.ml
  Fatal error: exception Failure("lib/mylib.ml-gen : empty map file or parse error")
  [2]

  $ ocamldep.opt -modules -ml-synonym .ml-gen -map lib/mylib.ml-gen -impl exe/main.ml
  exe/main.ml: Mylib Mylib__Foo

  $ cat exe/.main.objs/main.impl.all-deps
  cat: exe/.main.objs/main.impl.all-deps: No such file or directory
  [1]
