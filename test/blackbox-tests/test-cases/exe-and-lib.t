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
  Running[8]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I exe/.main.objs/byte -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Main__ -o exe/.main.objs/byte/main.cmo -c -impl exe/main.ml)
  Running[9]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I exe/.main.objs/byte -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Main__ -o exe/.main.objs/byte/main__Foo.cmo -c -impl exe/foo.ml)
  Running[10]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml-gen -no-alias-deps -opaque -o lib/.mylib.objs/native/mylib.cmx -c -impl lib/mylib.ml-gen)
  Running[11]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/byte/mylib__Bar.cmo -c -impl lib/bar.ml)
  Running[12]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -bin-annot -I lib/.mylib.objs/byte -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/byte/mylib__Foo.cmo -c -impl lib/foo.ml)
  Running[13]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -I exe/.main.objs/byte -I exe/.main.objs/native -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Main__ -o exe/.main.objs/native/main__Foo.cmx -c -impl exe/foo.ml)
  Running[14]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/native/mylib__Bar.cmx -c -impl lib/bar.ml)
  Running[15]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -I lib/.mylib.objs/byte -I lib/.mylib.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Mylib -o lib/.mylib.objs/native/mylib__Foo.cmx -c -impl lib/foo.ml)
  Running[16]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlc.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -a -o lib/mylib.cma lib/.mylib.objs/byte/mylib.cmo lib/.mylib.objs/byte/mylib__Foo.cmo lib/.mylib.objs/byte/mylib__Bar.cmo)
  Running[17]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -a -o lib/mylib.cmxa lib/.mylib.objs/native/mylib.cmx lib/.mylib.objs/native/mylib__Foo.cmx lib/.mylib.objs/native/mylib__Bar.cmx)
  Running[18]: (cd _build/default && /home/me/code/dune/_opam/bin/ocamlopt.opt -w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -g -shared -linkall -I lib -o lib/mylib.cmxs lib/mylib.cmxa)

  $ dune rules -r
  ((deps ((File (In_source_tree dune-project))))
   (targets ((files (_build/default/dune-project)) (directories ())))
   (context default)
   (action (copy dune-project _build/default/dune-project)))
  
  ((deps ((File (In_source_tree exe/dune))))
   (targets ((files (_build/default/exe/dune)) (directories ())))
   (context default)
   (action (copy exe/dune _build/default/exe/dune)))
  
  ((deps ((File (In_source_tree exe/foo.ml))))
   (targets ((files (_build/default/exe/foo.ml)) (directories ())))
   (context default)
   (action (copy exe/foo.ml _build/default/exe/foo.ml)))
  
  ((deps ())
   (targets ((files (_build/default/exe/main__.ml-gen)) (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (write-file
      exe/main__.ml-gen
      "(* generated by dune *)\
       \n\
       \n(** @canonical Main.Foo *)\
       \nmodule Foo = Main__Foo\
       \n\
       \nmodule Main__ = struct end\
       \n[@@deprecated \"this module is shadowed\"]\
       \n"))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/exe/main__.ml-gen))))
   (targets
    ((files
      (_build/default/exe/.main.objs/byte/main__.cmi
       _build/default/exe/.main.objs/byte/main__.cmo
       _build/default/exe/.main.objs/byte/main__.cmt))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -w
      -49
      -nopervasives
      -nostdlib
      -g
      -bin-annot
      -I
      exe/.main.objs/byte
      -no-alias-deps
      -opaque
      -o
      exe/.main.objs/byte/main__.cmo
      -c
      -impl
      exe/main__.ml-gen))))
  
  ((deps ((File (In_source_tree exe/main.ml))))
   (targets ((files (_build/default/exe/main.ml)) (directories ())))
   (context default)
   (action (copy exe/main.ml _build/default/exe/main.ml)))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__.cmi))
     (File (In_build_dir _build/default/exe/main.ml))))
   (targets
    ((files
      (_build/default/exe/.main.objs/byte/main.cmi
       _build/default/exe/.main.objs/byte/main.cmo
       _build/default/exe/.main.objs/byte/main.cmt))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -bin-annot
      -I
      exe/.main.objs/byte
      -I
      lib/.mylib.objs/byte
      -no-alias-deps
      -opaque
      -open
      Main__
      -o
      exe/.main.objs/byte/main.cmo
      -c
      -impl
      exe/main.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main.cmi))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__.cmi))
     (File (In_build_dir _build/default/exe/main.ml))))
   (targets
    ((files
      (_build/default/exe/.main.objs/native/main.cmx
       _build/default/exe/.main.objs/native/main.o))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -I
      exe/.main.objs/byte
      -I
      exe/.main.objs/native
      -I
      lib/.mylib.objs/byte
      -I
      lib/.mylib.objs/native
      -intf-suffix
      .ml
      -no-alias-deps
      -opaque
      -open
      Main__
      -o
      exe/.main.objs/native/main.cmx
      -c
      -impl
      exe/main.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__.cmi))
     (File (In_build_dir _build/default/exe/main__.ml-gen))))
   (targets
    ((files
      (_build/default/exe/.main.objs/native/main__.cmx
       _build/default/exe/.main.objs/native/main__.o))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -w
      -49
      -nopervasives
      -nostdlib
      -g
      -I
      exe/.main.objs/byte
      -I
      exe/.main.objs/native
      -intf-suffix
      .ml-gen
      -no-alias-deps
      -opaque
      -o
      exe/.main.objs/native/main__.cmx
      -c
      -impl
      exe/main__.ml-gen))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__.cmi))
     (File (In_build_dir _build/default/exe/foo.ml))))
   (targets
    ((files
      (_build/default/exe/.main.objs/byte/main__Foo.cmi
       _build/default/exe/.main.objs/byte/main__Foo.cmo
       _build/default/exe/.main.objs/byte/main__Foo.cmt))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -bin-annot
      -I
      exe/.main.objs/byte
      -I
      lib/.mylib.objs/byte
      -no-alias-deps
      -opaque
      -open
      Main__
      -o
      exe/.main.objs/byte/main__Foo.cmo
      -c
      -impl
      exe/foo.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__.cmi))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__Foo.cmi))
     (File (In_build_dir _build/default/exe/foo.ml))))
   (targets
    ((files
      (_build/default/exe/.main.objs/native/main__Foo.cmx
       _build/default/exe/.main.objs/native/main__Foo.o))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -I
      exe/.main.objs/byte
      -I
      exe/.main.objs/native
      -I
      lib/.mylib.objs/byte
      -I
      lib/.mylib.objs/native
      -intf-suffix
      .ml
      -no-alias-deps
      -opaque
      -open
      Main__
      -o
      exe/.main.objs/native/main__Foo.cmx
      -c
      -impl
      exe/foo.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/exe/.main.objs/native/main.cmx))
     (File (In_build_dir _build/default/exe/.main.objs/native/main.o))
     (File (In_build_dir _build/default/exe/.main.objs/native/main__.cmx))
     (File (In_build_dir _build/default/exe/.main.objs/native/main__.o))
     (File (In_build_dir _build/default/exe/.main.objs/native/main__Foo.cmx))
     (File (In_build_dir _build/default/exe/.main.objs/native/main__Foo.o))))
   (targets
    ((files (_build/default/exe/main.a _build/default/exe/main.cmxa))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -a
      -o
      exe/main.cmxa
      exe/.main.objs/native/main__.cmx
      exe/.main.objs/native/main.cmx
      exe/.main.objs/native/main__Foo.cmx))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main.cmo))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__.cmo))
     (File (In_build_dir _build/default/exe/.main.objs/byte/main__Foo.cmo))))
   (targets ((files (_build/default/exe/main.cma)) (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -a
      -o
      exe/main.cma
      exe/.main.objs/byte/main__.cmo
      exe/.main.objs/byte/main.cmo
      exe/.main.objs/byte/main__Foo.cmo))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/exe/main.a))
     (File (In_build_dir _build/default/exe/main.cmxa))))
   (targets ((files (_build/default/exe/main.cmxs)) (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -shared
      -linkall
      -I
      exe
      -o
      exe/main.cmxs
      exe/main.cmxa))))
  
  ((deps ((File (In_source_tree lib/bar.ml))))
   (targets ((files (_build/default/lib/bar.ml)) (directories ())))
   (context default)
   (action (copy lib/bar.ml _build/default/lib/bar.ml)))
  
  ((deps ((File (In_source_tree lib/dune))))
   (targets ((files (_build/default/lib/dune)) (directories ())))
   (context default)
   (action (copy lib/dune _build/default/lib/dune)))
  
  ((deps ((File (In_source_tree lib/foo.ml))))
   (targets ((files (_build/default/lib/foo.ml)) (directories ())))
   (context default)
   (action (copy lib/foo.ml _build/default/lib/foo.ml)))
  
  ((deps ())
   (targets ((files (_build/default/lib/mylib.ml-gen)) (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (write-file
      lib/mylib.ml-gen
      "(* generated by dune *)\
       \n\
       \n(** @canonical Mylib.Bar *)\
       \nmodule Bar = Mylib__Bar\
       \n\
       \n(** @canonical Mylib.Foo *)\
       \nmodule Foo = Mylib__Foo\
       \n"))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/lib/mylib.ml-gen))))
   (targets
    ((files
      (_build/default/lib/.mylib.objs/byte/mylib.cmi
       _build/default/lib/.mylib.objs/byte/mylib.cmo
       _build/default/lib/.mylib.objs/byte/mylib.cmt))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -w
      -49
      -nopervasives
      -nostdlib
      -g
      -bin-annot
      -I
      lib/.mylib.objs/byte
      -no-alias-deps
      -opaque
      -o
      lib/.mylib.objs/byte/mylib.cmo
      -c
      -impl
      lib/mylib.ml-gen))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib.cmi))
     (File (In_build_dir _build/default/lib/mylib.ml-gen))))
   (targets
    ((files
      (_build/default/lib/.mylib.objs/native/mylib.cmx
       _build/default/lib/.mylib.objs/native/mylib.o))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -w
      -49
      -nopervasives
      -nostdlib
      -g
      -I
      lib/.mylib.objs/byte
      -I
      lib/.mylib.objs/native
      -intf-suffix
      .ml-gen
      -no-alias-deps
      -opaque
      -o
      lib/.mylib.objs/native/mylib.cmx
      -c
      -impl
      lib/mylib.ml-gen))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib.cmi))
     (File (In_build_dir _build/default/lib/bar.ml))))
   (targets
    ((files
      (_build/default/lib/.mylib.objs/byte/mylib__Bar.cmi
       _build/default/lib/.mylib.objs/byte/mylib__Bar.cmo
       _build/default/lib/.mylib.objs/byte/mylib__Bar.cmt))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -bin-annot
      -I
      lib/.mylib.objs/byte
      -no-alias-deps
      -opaque
      -open
      Mylib
      -o
      lib/.mylib.objs/byte/mylib__Bar.cmo
      -c
      -impl
      lib/bar.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib.cmi))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib__Bar.cmi))
     (File (In_build_dir _build/default/lib/bar.ml))))
   (targets
    ((files
      (_build/default/lib/.mylib.objs/native/mylib__Bar.cmx
       _build/default/lib/.mylib.objs/native/mylib__Bar.o))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -I
      lib/.mylib.objs/byte
      -I
      lib/.mylib.objs/native
      -intf-suffix
      .ml
      -no-alias-deps
      -opaque
      -open
      Mylib
      -o
      lib/.mylib.objs/native/mylib__Bar.cmx
      -c
      -impl
      lib/bar.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib.cmi))
     (File (In_build_dir _build/default/lib/foo.ml))))
   (targets
    ((files
      (_build/default/lib/.mylib.objs/byte/mylib__Foo.cmi
       _build/default/lib/.mylib.objs/byte/mylib__Foo.cmo
       _build/default/lib/.mylib.objs/byte/mylib__Foo.cmt))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -bin-annot
      -I
      lib/.mylib.objs/byte
      -no-alias-deps
      -opaque
      -open
      Mylib
      -o
      lib/.mylib.objs/byte/mylib__Foo.cmo
      -c
      -impl
      lib/foo.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib.cmi))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib__Foo.cmi))
     (File (In_build_dir _build/default/lib/foo.ml))))
   (targets
    ((files
      (_build/default/lib/.mylib.objs/native/mylib__Foo.cmx
       _build/default/lib/.mylib.objs/native/mylib__Foo.o))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -I
      lib/.mylib.objs/byte
      -I
      lib/.mylib.objs/native
      -intf-suffix
      .ml
      -no-alias-deps
      -opaque
      -open
      Mylib
      -o
      lib/.mylib.objs/native/mylib__Foo.cmx
      -c
      -impl
      lib/foo.ml))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/native/mylib.cmx))
     (File (In_build_dir _build/default/lib/.mylib.objs/native/mylib.o))
     (File (In_build_dir _build/default/lib/.mylib.objs/native/mylib__Bar.cmx))
     (File (In_build_dir _build/default/lib/.mylib.objs/native/mylib__Bar.o))
     (File (In_build_dir _build/default/lib/.mylib.objs/native/mylib__Foo.cmx))
     (File (In_build_dir _build/default/lib/.mylib.objs/native/mylib__Foo.o))))
   (targets
    ((files (_build/default/lib/mylib.a _build/default/lib/mylib.cmxa))
     (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -a
      -o
      lib/mylib.cmxa
      lib/.mylib.objs/native/mylib.cmx
      lib/.mylib.objs/native/mylib__Foo.cmx
      lib/.mylib.objs/native/mylib__Bar.cmx))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlc.opt))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib.cmo))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib__Bar.cmo))
     (File (In_build_dir _build/default/lib/.mylib.objs/byte/mylib__Foo.cmo))))
   (targets ((files (_build/default/lib/mylib.cma)) (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlc.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -a
      -o
      lib/mylib.cma
      lib/.mylib.objs/byte/mylib.cmo
      lib/.mylib.objs/byte/mylib__Foo.cmo
      lib/.mylib.objs/byte/mylib__Bar.cmo))))
  
  ((deps
    ((File (External /home/me/code/dune/_opam/bin/ocamlopt.opt))
     (File (In_build_dir _build/default/lib/mylib.a))
     (File (In_build_dir _build/default/lib/mylib.cmxa))))
   (targets ((files (_build/default/lib/mylib.cmxs)) (directories ())))
   (context default)
   (action
    (chdir
     _build/default
     (run
      /home/me/code/dune/_opam/bin/ocamlopt.opt
      -w
      @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40
      -strict-sequence
      -strict-formats
      -short-paths
      -keep-locs
      -g
      -shared
      -linkall
      -I
      lib
      -o
      lib/mylib.cmxs
      lib/mylib.cmxa))))

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
  mylib__Foo
