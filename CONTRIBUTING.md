Dune is an community orientated open source project. It was originally
developed at [Jane Street][js] and is now maintained by Jane Street,
[Tarides][tarides] as well as several developers from the OCaml
community.

Contributions to Dune are welcome and should be submitted via GitHub
pull requests against the `main` branch. See [./doc/hacking.rst][hack]
for a guide to getting started on the code base.

Dune is distributed under the MIT license and contributors are
required to sign their work in order to certify that they have the
right to submit it under this license. See the following section for
more details.

Signing contributions
---------------------

We require that you sign your contributions. Your signature certifies
that you wrote the patch or otherwise have the right to pass it on as
an open-source patch. The rules are pretty simple: if you can certify
the below (from [developercertificate.org][dco]):

```
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.
1 Letterman Drive
Suite D4700
San Francisco, CA, 94129

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.


Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```

Then you just add a line to every git commit message:

```
Signed-off-by: Joe Smith <joe.smith@email.com>
```

Use your real name (sorry, no pseudonyms or anonymous contributions.)

If you set your `user.name` and `user.email` git configs, you can sign
your commit automatically with `git commit -s`.

It is possible to set up `git` so that it signs off automatically by using a
prepare-commit-msg hook in git. See <https://stackoverflow.com/a/46536244> for
details. As noted in the manual for `format.signOff`, note that adding the
`Signed-off-by` trailer should be a conscious act and means that you certify
you have the rights to submit this work under the same open source license.

[dco]: http://developercertificate.org/
[js]: https://www.janestreet.com/
[tarides]: https://tarides.com/
[hack]: ./doc/hacking.rst

Coding style
------------

- wrap lines at 80 characters,
- use `[Ss]nake_case` over `[Pp]ascalCase`.
