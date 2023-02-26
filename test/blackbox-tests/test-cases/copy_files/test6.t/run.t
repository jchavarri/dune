Test copying multiple files

  $ cat >dune-project <<EOF
  > (lang dune 3.8)
  > (using melange 0.1)
  > (package (name main))
  > EOF
  $ mkdir main
  $ cat >main/dune <<EOF
  > (executable
  >  (name main)
  >  (public_name main))
  > EOF
  $ cat >main/main.ml <<EOF
  > let () = print_endline "hello"
  > EOF
  $ cat >js/dune <<EOF
  > (library
  >  (name foo)
  >  (modes melange)
  >  (modules (:standard aa_fe_melange_dune_atd_hook aa_fe_melange_dune_gen_hook)))
  > 
  > ;;; Dummy file just to be able to add a custom dependency to the library
  > 
  > (rule
  >  (targets aa_fe_melange_dune_atd_hook.ml)
  >  (deps
  >   (file dune_requests_atd.sexp))
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run echo ""))))
  > 
  > ;;; Dune files generation for requests atd files
  > 
  > (rule
  >  (targets dune_requests_atd.sexp)
  >  (alias gen_dune)
  >  (mode promote)
  >  (deps
  >   (source_tree ../request)
  >   (source_tree ../atd)
  >   (package gen_esgg)
  >   %{bin:esgg})
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run gen_esgg gen_dune client atd ../request ../atd .))))
  > 
  > (include dune_requests_atd.sexp)
  > 
  > ;;; Dummy file just to be able to add a custom dependency to the library
  > 
  > (rule
  >  (targets aa_fe_melange_dune_gen_hook.ml)
  >  (deps
  >   (file dune_requests_gen.sexp))
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run echo ""))))
  > 
  > ;;; Dune files generation for requests _gen files
  > 
  > (rule
  >  (targets dune_requests_gen.sexp)
  >  (alias gen_dune)
  >  (mode promote)
  >  (deps
  >   (source_tree ../request)
  >   (package gen_esgg)
  >   %{bin:esgg})
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run gen_esgg gen_dune client bs ../request))))
  > (include dune_requests_atd.sexp)
  > (include dune_requests_gen.sexp)
  > (copy_files "../route_config/*.ml")
  > EOF
  $ cat >native/dune <<EOF
  > (library
  >  (name foo2)
  >  (modules (:standard dune_gen_hook)))
  > ;;; Dummy file just to be able to add a custom dependency to the library
  > 
  > (rule
  >  (targets dune_gen_hook.ml)
  >  (deps
  >   (file dune_requests_atd.sexp)
  >   (file dune_requests_gen.sexp))
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run echo ""))))
  > 
  > ;;; Dune files generation for requests atd files
  > 
  > (rule
  >  (targets dune_requests_atd.sexp)
  >  (alias gen_dune)
  >  (mode promote)
  >  (deps
  >   (source_tree ../request)
  >   (source_tree ../atd)
  >   (package gen_esgg)
  >   %{bin:esgg})
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run gen_esgg gen_dune server atd ../request ../atd .))))
  > 
  > (include dune_requests_atd.sexp)
  > 
  > ;;; Dune files generation for requests _gen files
  > 
  > (rule
  >  (targets dune_requests_gen.sexp)
  >  (alias gen_dune)
  >  (mode promote)
  >  (deps
  >   (source_tree ../request)
  >   (package gen_esgg)
  >   %{bin:esgg})
  >  (action
  >   (with-stdout-to
  >    %{targets}
  >    (run gen_esgg gen_dune server ../request .))))
  > (include dune_requests_atd.sexp)
  > (include dune_requests_gen.sexp)
  > (copy_files "../route_config/*.ml")
  > EOF
  $ dune build
