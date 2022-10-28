Cmj rule should include --bs-package-output
  $ dune rules my_project/app/.app.objs/melange/app.cmj | 
  > grep -e "--bs-package-output" --after-context=1 
      --bs-package-output
      _build/default/my_project/app

Cmj rule should include --bs-package-name
  $ dune rules my_project/app/.app.objs/melange/app.cmj | 
  > grep -e "--bs-package-name" --after-context=1 
      --bs-package-name
      pkg

Js rule should include --bs-module-type
  $ dune rules my_project/output/app/app__B.js | 
  > grep -e "--bs-module-type" --after-context=1 
      --bs-module-type
      commonjs

Js rule should include --bs-package-name
  $ dune rules my_project/output/app/app__B.js | 
  > grep -e "--bs-package-name" --after-context=1 
      --bs-package-name
      pkg

Build js files target output location
  $ dune build my_project/output/app/app__B.js
  $ node _build/default/my_project/output/app/app__B.js
  buy it
