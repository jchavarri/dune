window.BENCHMARK_DATA = {
  "lastUpdate": 1675095408030,
  "repoUrl": "https://github.com/ocaml/dune",
  "entries": {
    "Melange Benchmark": [
      {
        "commit": {
          "author": {
            "email": "javier.chavarri@gmail.com",
            "name": "Javier Chávarri",
            "username": "jchavarri"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "905247a2e69cbc0a10fd86a314504e4103eaf40c",
          "message": "melange: add build benchmark to ci (#6791)\n\nSigned-off-by: Javier Chávarri <javier.chavarri@gmail.com>",
          "timestamp": "2022-12-29T15:53:30-06:00",
          "tree_id": "06291f117daf78ff12d184f40b41ec0b3755bd2b",
          "url": "https://github.com/ocaml/dune/commit/905247a2e69cbc0a10fd86a314504e4103eaf40c"
        },
        "date": 1672352576731,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "41.88697116556667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "752ba97135b04d1f5e4a4c171bd35f3551e73c65",
          "message": "test(melange): include_subdirs (#6810)\n\ntest should include .js paths to show that they're currently wrong\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2022-12-29T16:46:32-06:00",
          "tree_id": "08bc84c1c9e4ad86e6b817bde15acc4d309d9003",
          "url": "https://github.com/ocaml/dune/commit/752ba97135b04d1f5e4a4c171bd35f3551e73c65"
        },
        "date": 1672355228489,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "38.341008513940004",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "344f618d035ccb12fea78f4f8bb3996d0192fd3c",
          "message": "chore(fiber): add pool benchmarks (#6813)\n\nBenchmark the Fiber.Pool implementation\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2022-12-30T00:44:54-06:00",
          "tree_id": "7bbb1f43a7b7bb7a2ccea15b16cf5dff87145f82",
          "url": "https://github.com/ocaml/dune/commit/344f618d035ccb12fea78f4f8bb3996d0192fd3c"
        },
        "date": 1672384014418,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "40.397050457726664",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "cf96d82837dd422391bac47cdc747b098018ee65",
          "message": "test(fiber): Pool.{run,stop} tests (#6812)\n\n* double running a pool should be forbidden\r\n* stopping and then running is allowed\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2022-12-30T01:30:13-06:00",
          "tree_id": "8cab5ec95b4e1b7d2198aa94fe0f7b6dd28ca90a",
          "url": "https://github.com/ocaml/dune/commit/cf96d82837dd422391bac47cdc747b098018ee65"
        },
        "date": 1672390817074,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "38.03061777441334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "b1ae0c773116e53a911d934cbdb9f6d5dbbe25ff",
          "message": "refactor(rpc): distinguish Timeout from Shutdown (#6802)\n\nWhen the scheduler shuts down due to a timeout (during testing), we\r\nclarify this in the error message.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2022-12-31T09:10:03-06:00",
          "tree_id": "42d5b03f36bae68c7f64240f6fff18c88fa53f27",
          "url": "https://github.com/ocaml/dune/commit/b1ae0c773116e53a911d934cbdb9f6d5dbbe25ff"
        },
        "date": 1672500975994,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "48.57778337701334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "1b6570f7011cc21a53fa7bb3a5cd077aa84c69b2",
          "message": "fix(dune_console): print missing newline after dune exec (#6821)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-03T19:44:06-06:00",
          "tree_id": "b66f046a22726b54e56eb46d6beac2cae19a2f9d",
          "url": "https://github.com/ocaml/dune/commit/1b6570f7011cc21a53fa7bb3a5cd077aa84c69b2"
        },
        "date": 1672798529027,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "38.658632765246665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "bf97454e2202098f3a08a13c8ccd1d0087f047a2",
          "message": "chore: update build_path_prefix_map (#6826)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-04T13:21:16-06:00",
          "tree_id": "12fd23fc50e0b89320b4f45b64e32238c5297f75",
          "url": "https://github.com/ocaml/dune/commit/bf97454e2202098f3a08a13c8ccd1d0087f047a2"
        },
        "date": 1672861360305,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "37.50016077142667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "2609315+esope@users.noreply.github.com",
            "name": "Benoit Montagu",
            "username": "esope"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "9f6da11209cbb2e47cebf09e1002a35a2cd2be9d",
          "message": "Use alphabetical ordering of stanzas in manual (#6824)\n\nSigned-off-by: Benoît Montagu <benoit.montagu@inria.fr>",
          "timestamp": "2023-01-04T13:22:35-06:00",
          "tree_id": "df945556fc1edc9ab1ba2ce61a547c8fa979717a",
          "url": "https://github.com/ocaml/dune/commit/9f6da11209cbb2e47cebf09e1002a35a2cd2be9d"
        },
        "date": 1672861489801,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "41.87944795932",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "1489c57adc6483f3d98b9621e63b85bbd50cdc89",
          "message": "feature(cache): add `dune cache size` command (#6638)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-04T13:28:21-06:00",
          "tree_id": "4d73b6cbf9105b2f0234d97a7de2590b369b5db2",
          "url": "https://github.com/ocaml/dune/commit/1489c57adc6483f3d98b9621e63b85bbd50cdc89"
        },
        "date": 1672861600249,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.57483041076667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "fa91afcbe1dab60d868df32d09b331a94fe30efb",
          "message": "chore(nix): update flakes (#6806)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-04T13:26:09-06:00",
          "tree_id": "56b220a06ea4597996e09c3bdf200e40216ad299",
          "url": "https://github.com/ocaml/dune/commit/fa91afcbe1dab60d868df32d09b331a94fe30efb"
        },
        "date": 1672861787155,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "46.08527931125334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "cadeaudeelie@gmail.com",
            "name": "Et7f3",
            "username": "Et7f3"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "cde7139c8e25836f1b2d41819ba55d9e925fa332",
          "message": "build: needs CoreFoundation instead of Foundation (#6829)\n\nSigned-off-by: Élie BRAMI <cadeaudeelie@gmail.com>",
          "timestamp": "2023-01-04T15:54:21-06:00",
          "tree_id": "6e8396db40890952c92cba17c66ed72c7a561772",
          "url": "https://github.com/ocaml/dune/commit/cde7139c8e25836f1b2d41819ba55d9e925fa332"
        },
        "date": 1672870729900,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.38860668158667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "n.oje.bar@gmail.com",
            "name": "Nicolás Ojeda Bär",
            "username": "nojb"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "620b98bb01835ac846dbd352c4b62c7d1bfcb697",
          "message": "Fix Jsoo rules bug: artifacts of libraries with public names are not found (#6828)\n\nSigned-off-by: Nicolás Ojeda Bär <n.oje.bar@gmail.com>\r\nSigned-off-by: Hugo Heuzard <hugo.heuzard@gmail.com>\r\nCo-authored-by: Hugo Heuzard <hugo.heuzard@gmail.com>",
          "timestamp": "2023-01-05T06:57:02+01:00",
          "tree_id": "1c3a91166e5e0b7ecdbb43b012528d4fa065d674",
          "url": "https://github.com/ocaml/dune/commit/620b98bb01835ac846dbd352c4b62c7d1bfcb697"
        },
        "date": 1672899688545,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "47.340776414353336",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "david.allsopp@metastack.com",
            "name": "David Allsopp",
            "username": "dra27"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "35d9a3c92bd874547f6b9d9cca6cfa4968ac87cd",
          "message": "Fix boot/libs.ml between 4.x/5.x (#6753)\n\nSigned-off-by: David Allsopp <david.allsopp@metastack.com>",
          "timestamp": "2023-01-05T09:39:21-06:00",
          "tree_id": "bed9658eb4715c6a395248f56646f37aea81c6c4",
          "url": "https://github.com/ocaml/dune/commit/35d9a3c92bd874547f6b9d9cca6cfa4968ac87cd"
        },
        "date": 1672934276015,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.273181545713335",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "4358616cc6cfc09f188a9a50051b1cae1db964a9",
          "message": "refactor(rules): move cram rules to own dir (#6835)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-05T15:50:54-06:00",
          "tree_id": "9516be3a59854bb743abb58fe11d8465cd75d157",
          "url": "https://github.com/ocaml/dune/commit/4358616cc6cfc09f188a9a50051b1cae1db964a9"
        },
        "date": 1672956778829,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "41.89532303838",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "f2c106256296af86c81301ffe95c926ef74c610c",
          "message": "refactor(rules): move ctypes to own dir (#6834)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-05T18:38:47-06:00",
          "tree_id": "2ddc0c11e870d42cc659eaf98acac8b205324562",
          "url": "https://github.com/ocaml/dune/commit/f2c106256296af86c81301ffe95c926ef74c610c"
        },
        "date": 1672966738189,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "37.11957626576",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "1c84d1b2b9035565c37cfba6ad51d4ff22c781f4",
          "message": "refactor: move ocaml commands to own folder (#6833)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-06T09:21:43-06:00",
          "tree_id": "a5c1da127e65f53d3267054cdc513a2a1a1537f0",
          "url": "https://github.com/ocaml/dune/commit/1c84d1b2b9035565c37cfba6ad51d4ff22c781f4"
        },
        "date": 1673020258265,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.83941521134667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "63e6845a89eab969323c88673533271b9e3c0baf",
          "message": "Ctypes: detect duplicate function descriptions (#6751)\n\n* test: ctypes stanza with dup function_description\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\n* fix: improve error message\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-06T17:27:14+01:00",
          "tree_id": "20c0a4d76c9b3bbe15f97a143c8384a95541fa1b",
          "url": "https://github.com/ocaml/dune/commit/63e6845a89eab969323c88673533271b9e3c0baf"
        },
        "date": 1673024178955,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "44.05186140538666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0a6ba087f185cf898ec46f4488e4dcf4a90dda93",
          "message": "refactor: move module settings to a common type (#6819)\n\nModule settings are now stored in a single record. These settings are\r\nshared between melange stanzas, executables, and libraries.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-08T10:06:48-06:00",
          "tree_id": "04f3b0a5be69560f503aa18b27013202446521eb",
          "url": "https://github.com/ocaml/dune/commit/0a6ba087f185cf898ec46f4488e4dcf4a90dda93"
        },
        "date": 1673195324560,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "32.67942630764",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "anmonteiro@gmail.com",
            "name": "Antonio Nuno Monteiro",
            "username": "anmonteiro"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "df0ec33fc99e175f08fff6364c7c2a6ac6ed1e5a",
          "message": "chore(nix): remove `dune_3` from devShells.slim.buildInputs (#6840)\n\nthis makes `./dune.exe exec -- $EDITOR` work\r\n\r\nSigned-off-by: Antonio Nuno Monteiro <anmonteiro@gmail.com>",
          "timestamp": "2023-01-09T09:50:02-06:00",
          "tree_id": "8f8ea91c46790ead384f904975dd45d839f04b0b",
          "url": "https://github.com/ocaml/dune/commit/df0ec33fc99e175f08fff6364c7c2a6ac6ed1e5a"
        },
        "date": 1673280535247,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.68372456580667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0167e6cf6d035268a38c8638f5d4cad7239580e3",
          "message": "fix(dyn): don't break boxes when printing (#6836)\n\nUse [Pp.cut] rather than [Pp.newline] as the seperator. This should\r\noutput a box respecting newline since we're in a vertical box.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-09T09:50:42-06:00",
          "tree_id": "788c9be6b7e86489b0951999d9a892eb5ec66b1c",
          "url": "https://github.com/ocaml/dune/commit/0167e6cf6d035268a38c8638f5d4cad7239580e3"
        },
        "date": 1673280658407,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "39.98567882435333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "c2139223abdb31af83e5476baf249ef140a112b1",
          "message": "doc: split stanza documentation in several files (#6851)\n\nThe HTML output is identical (this is like a preprocessor include) but\r\nthis makes the source file a lot smaller.\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-09T17:09:56+01:00",
          "tree_id": "4b91f8fbd5024c61c992543feb4a6dc054df423e",
          "url": "https://github.com/ocaml/dune/commit/c2139223abdb31af83e5476baf249ef140a112b1"
        },
        "date": 1673281711809,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.41149613973334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "284fb0f1b393882c94be260c2898be5e2d531fd6",
          "message": "doc: add notes on benchmarks (#6815)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-09T10:19:29-06:00",
          "tree_id": "a76e0dcbdde70fcc4e2fa1cd7d9021d096782710",
          "url": "https://github.com/ocaml/dune/commit/284fb0f1b393882c94be260c2898be5e2d531fd6"
        },
        "date": 1673282300985,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.24856346404666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "ebcad123c43868b7a5c1a9fefdbac5ec142afbbb",
          "message": "doc: remove spurious bold styling in ctypes doc (#6849)\n\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-09T17:17:18+01:00",
          "tree_id": "be1747dacb33e0d868e24eb80b58f5aaf58331e0",
          "url": "https://github.com/ocaml/dune/commit/ebcad123c43868b7a5c1a9fefdbac5ec142afbbb"
        },
        "date": 1673282445920,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "43.29923563302666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "stephen@sherra.tt",
            "name": "Stephen Sherratt",
            "username": "gridbugs"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "5ff9a4fb0be075a26379b537677e15398113f14a",
          "message": "feature: Eager watch mode for exec (#6507)\n\nSigned-off-by: Stephen Sherratt <stephen@sherra.tt>",
          "timestamp": "2023-01-09T10:22:18-06:00",
          "tree_id": "5c04e65112f5f5c8d1f722891ef3d98ae4627aa4",
          "url": "https://github.com/ocaml/dune/commit/5ff9a4fb0be075a26379b537677e15398113f14a"
        },
        "date": 1673282717156,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "44.03702566735333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "github@vvalter.com",
            "name": "Simon Rainer",
            "username": "Vvalter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "d822fd7a9d9c854e2d67f703a28da402a2c019c9",
          "message": "Fix formatting problems in quick-start.rst (#6846)\n\nSigned-off-by: Simon Rainer <sr@mail25.de>\r\n\r\nSigned-off-by: Simon Rainer <sr@mail25.de>\r\nCo-authored-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-09T17:34:02+01:00",
          "tree_id": "b1942b1f8d46a2ff651511e5b1d280f283ad6fe6",
          "url": "https://github.com/ocaml/dune/commit/d822fd7a9d9c854e2d67f703a28da402a2c019c9"
        },
        "date": 1673283174457,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.91652652354",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "90ea7339e3b00eec10ef12aa6b2abdbb8d8cc313",
          "message": "doc: remove migration page (#6850)\n\n* doc: remove migration page\r\n\r\nThis document has been useful to document the jbuilder -> dune migration\r\nbut it is now not useful anymore.\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\n* Remove MIGRATION.md\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\n* Add a history paragraph\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-09T17:53:52+01:00",
          "tree_id": "1f13a45ac8a3a116ae7cca85fa3cbb28726a3614",
          "url": "https://github.com/ocaml/dune/commit/90ea7339e3b00eec10ef12aa6b2abdbb8d8cc313"
        },
        "date": 1673284360402,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.09777807080667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "715825e0b032015ff7f1652a2b3ea448513c43ac",
          "message": "chore: move menhir rules to menhir dir (#6858)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-09T19:09:30-06:00",
          "tree_id": "b1cd254d3237431abca4360c03fd589981491145",
          "url": "https://github.com/ocaml/dune/commit/715825e0b032015ff7f1652a2b3ea448513c43ac"
        },
        "date": 1673314105453,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.54283112262001",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "77136fa2813caaccd1738ce7c91c9c04e5350665",
          "message": "chore: move generate_sites_module rules to generate_sites_module (#6860)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-09T20:21:33-06:00",
          "tree_id": "9488841f668376b4ad5e494c3e5e0dd815a37d4e",
          "url": "https://github.com/ocaml/dune/commit/77136fa2813caaccd1738ce7c91c9c04e5350665"
        },
        "date": 1673318417158,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.678875267340004",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "d1e0d363cc19207c0739c0ff0bda5bde642facdd",
          "message": "doc: use sphinx version metadata instead of titles (#6863)\n\nThis removes \"since x.y\" from titles, in particular this unclutters the\r\nTOC.\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-10T15:19:30+01:00",
          "tree_id": "1bdc320933a937bc5e73565a480d5d1cd4ff125b",
          "url": "https://github.com/ocaml/dune/commit/d1e0d363cc19207c0739c0ff0bda5bde642facdd"
        },
        "date": 1673361499644,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.416830723273335",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "129383785c30f65691822a8b27e10e57bfd03bfa",
          "message": "chore: move merlin rules to merlin dir (#6857)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-10T09:05:53-06:00",
          "tree_id": "36ce51209f92c0f73c31697359f0a46818c6acf8",
          "url": "https://github.com/ocaml/dune/commit/129383785c30f65691822a8b27e10e57bfd03bfa"
        },
        "date": 1673364735809,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "46.6337287115",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "b3af9e7974ba9a95e61e47ccdd3469a81a77aa3a",
          "message": "test: ctypes and relative include paths (#6838)\n\nThis adds a test that shows that under `(using ctypes 0.2)`, local\r\nheaders need to be added in two different locations because rules are\r\nexecuted from different places. See #5325.\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-10T17:45:57+01:00",
          "tree_id": "5b92b181fb18444c50793f6bd8907e0d8a910e85",
          "url": "https://github.com/ocaml/dune/commit/b3af9e7974ba9a95e61e47ccdd3469a81a77aa3a"
        },
        "date": 1673370605806,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "42.62877656914666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "javier.chavarri@gmail.com",
            "name": "Javier Chávarri",
            "username": "jchavarri"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "6d503e71e96d68b268e86a36b12c165bd107b8e2",
          "message": "ctypes: rename stanza to field (#6862)\n\nSigned-off-by: Javier Chávarri <javier.chavarri@gmail.com>",
          "timestamp": "2023-01-10T13:18:25-06:00",
          "tree_id": "2d4dc53174828773a753e92e866956db7766ca98",
          "url": "https://github.com/ocaml/dune/commit/6d503e71e96d68b268e86a36b12c165bd107b8e2"
        },
        "date": 1673379461209,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.999742637353336",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "distinct": true,
          "id": "acc93cf7dc6233516cf979001e47dfc736899e60",
          "message": "chore: move coq bin and rules to own \"coq\" directories\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>\n\n<!-- ps-id: 05f539af-7554-4b91-9083-9f7870126e3c -->",
          "timestamp": "2023-01-10T21:45:42+01:00",
          "tree_id": "4c687d5f374ff61ff316f5a2f27722703c0c777f",
          "url": "https://github.com/ocaml/dune/commit/acc93cf7dc6233516cf979001e47dfc736899e60"
        },
        "date": 1673384650036,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.03580306272",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "03dcc5d6dfef684623f94017daddf1fd93ee3737",
          "message": "fix: staged_pps should work (#6748)\n\nSetting sandboxing by default would break staged_pps because it would\r\ntransitively make various compilation commands to be sandboxed as well\r\nwhich is not supported.\r\n\r\nWe restore the old (no sandboxing) default to staged_pps\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-10T17:59:12-06:00",
          "tree_id": "1784b2683e631f7d9a274e8ed43e69c15defb971",
          "url": "https://github.com/ocaml/dune/commit/03dcc5d6dfef684623f94017daddf1fd93ee3737"
        },
        "date": 1673396488802,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.099764013026665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "anmonteiro@gmail.com",
            "name": "Antonio Nuno Monteiro",
            "username": "anmonteiro"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "7222f67542e2ed5d0b11d1b50bc2c6f729cb5ba6",
          "message": "feat(melange): install melange libraries (#6602)\n\nSigned-off-by: Antonio Nuno Monteiro <anmonteiro@gmail.com>\r\nSigned-off-by: Javier Chavarri <javier.chavarri@gmail.com>\r\nCo-authored-by: Javier Chavarri <javier.chavarri@gmail.com>",
          "timestamp": "2023-01-10T20:01:28-06:00",
          "tree_id": "57196e4dc76f307924f3a7b1a567b6ec1437ae53",
          "url": "https://github.com/ocaml/dune/commit/7222f67542e2ed5d0b11d1b50bc2c6f729cb5ba6"
        },
        "date": 1673403629417,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.777687409546665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "a83e71c3d715722ee7e774b32225c2c29bd57664",
          "message": "doc: use a table to document opam sections (#6868)\n\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-11T17:54:13+01:00",
          "tree_id": "de84305f8feeb7223481205ccc32a7c1c73becfd",
          "url": "https://github.com/ocaml/dune/commit/a83e71c3d715722ee7e774b32225c2c29bd57664"
        },
        "date": 1673457205168,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "37.321133905059995",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "stephen@sherra.tt",
            "name": "Stephen Sherratt",
            "username": "gridbugs"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "184809335a06fcca5597a3ff35eee5729d894207",
          "message": "Revert \"feature: Eager watch mode for exec (#6507)\" (#6867)\n\nThis reverts commit 5ff9a4fb0be075a26379b537677e15398113f14a.\r\n\r\nThis was causing occasional segfaults on macos when running `dune exec`\r\nso reverting this until we figure out what's causing that.\r\n\r\nSigned-off-by: Stephen Sherratt <stephen@sherra.tt>",
          "timestamp": "2023-01-11T19:48:16-06:00",
          "tree_id": "e0c260cd8a69340209101bef18eaa0254d4e6468",
          "url": "https://github.com/ocaml/dune/commit/184809335a06fcca5597a3ff35eee5729d894207"
        },
        "date": 1673489227222,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.00361290173334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "2a8c5ded687869bf0a7dea802105caaae55f8de8",
          "message": "refactor(merlin): remove unnecessary read_memo (#6871)\n\nThe use is completely unnecessary here as we're inside the action\r\nbuilder monad anyway\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-12T12:56:55-06:00",
          "tree_id": "71c2d7c9db4b0e4b10b5f42f58d389daf47d7dfa",
          "url": "https://github.com/ocaml/dune/commit/2a8c5ded687869bf0a7dea802105caaae55f8de8"
        },
        "date": 1673550956458,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.80896740932666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "c2833c6aa56108731487f3840ff72ed29cff374b",
          "message": "chore: leave some TODO's for rule loading (#6872)\n\nDocument a a few places where our rule loading is not lazy enough and\r\nprevents all the rules in a particular directory from being loaded.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-12T15:20:48-06:00",
          "tree_id": "0d7dea5cf82ccbdb31b196fd888a9907fbc08943",
          "url": "https://github.com/ocaml/dune/commit/c2833c6aa56108731487f3840ff72ed29cff374b"
        },
        "date": 1673559793123,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "42.45738344034",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "43c211e8dfaa9fb8ef0a1a0a70db4397016dc6f5",
          "message": "chore: move melange rules to melange dir (#6859)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-13T08:35:46-06:00",
          "tree_id": "c5a5a9f5133209497691d848b73182072002ccde",
          "url": "https://github.com/ocaml/dune/commit/43c211e8dfaa9fb8ef0a1a0a70db4397016dc6f5"
        },
        "date": 1673621740396,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.539878767286666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "80a0b792c135cb4a09649680e5a51674590262c1",
          "message": "test(rules): demonstrate rule loading bug (#6873)\n\nIf there's an invalid virtual library implementation, it's impossible to\r\nload any of the rules in the directory.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T08:36:31-06:00",
          "tree_id": "e842c24a35519b263a3ae1f9fe06e03ead42dcfc",
          "url": "https://github.com/ocaml/dune/commit/80a0b792c135cb4a09649680e5a51674590262c1"
        },
        "date": 1673621816283,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.70232940215333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "b5e2d3ef2bbf6bada4fbdf163a5fcf2cec07acf9",
          "message": "refactor(rules): remove unused argument (#6877)\n\n[do_not_fail] is never passed when finding the instrumentation backend\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T10:49:34-06:00",
          "tree_id": "8b7aec6cf027010836642efa6478a24a2f0422a7",
          "url": "https://github.com/ocaml/dune/commit/b5e2d3ef2bbf6bada4fbdf163a5fcf2cec07acf9"
        },
        "date": 1673629931301,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.26034425712667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "30d385f6cc44c485ecbb4f3282eabc3479003b41",
          "message": "Merge 3.6.2 changelog (#6874)\n\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-13T16:10:32Z",
          "tree_id": "0ac1804c1307416f58ae49be780e88211f0c55e4",
          "url": "https://github.com/ocaml/dune/commit/30d385f6cc44c485ecbb4f3282eabc3479003b41"
        },
        "date": 1673629933088,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.91390320243333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "c24c5a7ad782c61d8fa550c2353ba167a9e5896b",
          "message": "Add code of conduct (#6875)\n\nThis code of conduct lives in <https://github.com/ocaml/code-of-conduct>\r\nand has been discussed [in this\r\nthread](https://discuss.ocaml.org/t/ocaml-community-code-of-conduct/10494).\r\nIt has been adopted in ocaml/ocaml in ocaml/ocaml#11761, and after a\r\ndiscussion between project maintainers it is now enabled in dune as\r\nwell.\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-13T16:10:48Z",
          "tree_id": "d80d46dc7defd1766f7dfd1ebe690747436baf88",
          "url": "https://github.com/ocaml/dune/commit/c24c5a7ad782c61d8fa550c2353ba167a9e5896b"
        },
        "date": 1673629951942,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.283180139686664",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "9ca0f2c1a08b358c428abb6017b985f84c24e1c6",
          "message": "chore: add a comment about a race condition (#6876)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T10:30:11-06:00",
          "tree_id": "8442725c28ad7c3aced33a1888f5f42629a62afc",
          "url": "https://github.com/ocaml/dune/commit/9ca0f2c1a08b358c428abb6017b985f84c24e1c6"
        },
        "date": 1673630059002,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.963501130026664",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "bcb65745c86faeb31fbc292a8f05a466d8b890d1",
          "message": "refactor(rules): remove unnecessary field (#6878)\n\n[instrument_with] is already used inside [lib_config]\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T10:32:48-06:00",
          "tree_id": "a955583efb6083b45182164cffabfb3d67dd95f3",
          "url": "https://github.com/ocaml/dune/commit/bcb65745c86faeb31fbc292a8f05a466d8b890d1"
        },
        "date": 1673630060076,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.9350002681",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "javier.chavarri@gmail.com",
            "name": "Javier Chávarri",
            "username": "jchavarri"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "5030332dcd044d8fd6c7c0b90b81596d5cf8c6b1",
          "message": "test(melange): add test with copy_files (#6701)\n\ncopy_files and include_subdirs\r\n\r\nSigned-off-by: Javier Chavarri <javier.chavarri@gmail.com>",
          "timestamp": "2023-01-13T10:35:00-06:00",
          "tree_id": "cacb477d5dc33145a0f44e637269b8f1515f2d53",
          "url": "https://github.com/ocaml/dune/commit/5030332dcd044d8fd6c7c0b90b81596d5cf8c6b1"
        },
        "date": 1673630072942,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.43197574551334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "fae5fb59a6776bf8804239083e5a552fd3cb3ebd",
          "message": "chore(rules): leave source gathering TODO (#6880)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T18:11:38-06:00",
          "tree_id": "9f2682529922746e5858a2f145dd2e5da514a551",
          "url": "https://github.com/ocaml/dune/commit/fae5fb59a6776bf8804239083e5a552fd3cb3ebd"
        },
        "date": 1673656772493,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "32.943001525393335",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "d256c7bbba090750988d3943418bdec7bd9c3250",
          "message": "refactor(rules): bootstrap info (#6881)\n\nonly pass the linking closure because that is the only thing that is\r\nbeing used.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T18:10:51-06:00",
          "tree_id": "b405f99fa27b1babda6202ac7d5873cd08d4ddd9",
          "url": "https://github.com/ocaml/dune/commit/d256c7bbba090750988d3943418bdec7bd9c3250"
        },
        "date": 1673656784308,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.24179583137334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "3fd3e01fc9c2dfaf7e9abce7a76de76f9dfc722a",
          "message": "refactor: invert some if not .. else expressions (#6882)\n\nthey are just harder to read in all these cases\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-13T18:10:14-06:00",
          "tree_id": "c4e618bdd5c184eb870da76db97d14c58f77405d",
          "url": "https://github.com/ocaml/dune/commit/3fd3e01fc9c2dfaf7e9abce7a76de76f9dfc722a"
        },
        "date": 1673656978408,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "41.11123451716001",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "4a518c0fbbde5c6cbeeb8e20c024dfe0618d9644",
          "message": "refactor(rules): ues [Option.map] (#6879)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>\r\n\r\n<!-- ps-id: 2700fab2-6025-40e2-996c-ae1a9f77091c -->",
          "timestamp": "2023-01-13T18:11:13-06:00",
          "tree_id": "49fc617ee3f9ff225e42ec691507bdb26cc1e078",
          "url": "https://github.com/ocaml/dune/commit/4a518c0fbbde5c6cbeeb8e20c024dfe0618d9644"
        },
        "date": 1673657103743,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "43.537363901240006",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "98bf1d05f53f5ae6a64bd82ac25266f108e05ec7",
          "message": "refactor(rpc): put menu into rpc session (#6803)\n\nrather than managing it through a callback\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-16T10:27:34-06:00",
          "tree_id": "366a5f828eeddee3ae0c93c8d99a6092c9a0e4ad",
          "url": "https://github.com/ocaml/dune/commit/98bf1d05f53f5ae6a64bd82ac25266f108e05ec7"
        },
        "date": 1673887561402,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.15521081666666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "3521dfa4144ed60fed047769031cba3432531a62",
          "message": "fix(scheduler): flush stats when idle (#6891)\n\n[dune --trace-file] currently relies on the output channel to flush the\r\nevents when it's internal buffer is full. This isn't a problem for a\r\nnormal build, because we only want to observe the trace file once dune\r\nterminates, but it is a problem for watch mode. In watch mode, we have\r\nto wait an arbitrary amount of time until the buffer gets filled up and\r\nis flushed.\r\n\r\nThis commit flushes the events output channel in watch mode whenever\r\nwe're idling and waiting for file system events to arrive.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-16T11:13:44-06:00",
          "tree_id": "e52bcfaac68ba5e09e966306965e5858e175fe34",
          "url": "https://github.com/ocaml/dune/commit/3521dfa4144ed60fed047769031cba3432531a62"
        },
        "date": 1673890527740,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.36363642134",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0972be85f53c71e71a8328842c9555301f101d42",
          "message": "refactor: Build_system.Error.info (#6888)\n\nPreviously, [Build_system.Error.info] would return a tuple that was hard\r\nto read. We convert it into a record to make it easier.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-16T11:23:35-06:00",
          "tree_id": "a8a2d812aac31956ac7ac2052e0dd068e6fc665b",
          "url": "https://github.com/ocaml/dune/commit/0972be85f53c71e71a8328842c9555301f101d42"
        },
        "date": 1673891264556,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "44.922634288199994",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "073778234aeccfa125b6df14af0f88a2e431166a",
          "message": "fix(melange): include_subdirs (#6811)\n\ncopy the file path from the source\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-16T15:19:04-06:00",
          "tree_id": "2e477528b11339cf6fc62d5a0f82cdf3503eb06c",
          "url": "https://github.com/ocaml/dune/commit/073778234aeccfa125b6df14af0f88a2e431166a"
        },
        "date": 1673905088044,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.251742597926665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "anmonteiro@gmail.com",
            "name": "Antonio Nuno Monteiro",
            "username": "anmonteiro"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "47150f22336913a3e356bc812bd4b887e483f4fc",
          "message": "fix(melange): switch `--bs-package-name` to library name (#6841)\n\nUse the public library name rather than the package name to determine the path under `node_modules/`.\r\n\r\nThis allows public melange libraries from the same package to co-exist in the same `melange.emit`.\r\n\r\nSigned-off-by: Antonio Nuno Monteiro <anmonteiro@gmail.com>\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-16T19:10:40-06:00",
          "tree_id": "7276457f9ce78469124b565c8893c713382b4ce8",
          "url": "https://github.com/ocaml/dune/commit/47150f22336913a3e356bc812bd4b887e483f4fc"
        },
        "date": 1673918944406,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.481419861499994",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "73a3b3bac4ffeba5143a4e1a2e9bccb5c7eda815",
          "message": "chore: move jsoo rules to jsoo dir (#6861)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-16T19:13:10-06:00",
          "tree_id": "90807e7dc91ddb1d56842c92d8d10a63ed9b78db",
          "url": "https://github.com/ocaml/dune/commit/73a3b3bac4ffeba5143a4e1a2e9bccb5c7eda815"
        },
        "date": 1673919257937,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.89105236751333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "23d3f261e890dadf0590b7c192424facddad8d56",
          "message": "fix(metrics): output correct process metrics (#6892)\n\nBefore this commit we would output an \"async\" start event when a process\r\nawould start nd then a \"complete\" event when it would be finished.\r\n\r\nThe \"async\" start event is unnecessary and this commit removes it. All\r\nthe information recorded in the \"async\" start event is therefore moved\r\nto the complete event.\r\n\r\nThe new output is now properly displayed by the various visualization\r\ntools (perfetto, chrome)\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-16T19:23:49-06:00",
          "tree_id": "6d55dc3ae1524842a0912a5a7d0cb9d539a3517d",
          "url": "https://github.com/ocaml/dune/commit/23d3f261e890dadf0590b7c192424facddad8d56"
        },
        "date": 1673919777032,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.404218036846665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "7d11af7c84208239f9c705a542ef3fc0409469f7",
          "message": "chore: improve error messages with 2 locations (#6890)\n\nThe location of both of the libraries can be included by adding one of\r\nthe libraries as a \"related\" error. The end result is that both error\r\nmessages will be available to jump in rpc clients that consume\r\ndiagnostics\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-17T08:29:19-06:00",
          "tree_id": "076695c0a72c4c4f6dbd395e70dc64c8dc8b5b03",
          "url": "https://github.com/ocaml/dune/commit/7d11af7c84208239f9c705a542ef3fc0409469f7"
        },
        "date": 1673966897969,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.733694540959995",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "dfa29d3bb507247da3b9c15d8aaa741467d15077",
          "message": "test: wait for dune shutdown (#6898)\n\nModify stop_dune to wait until dune actually shuts down.\r\n\r\nThis is needed for tests such as stray-process.t which rely on their\r\nassertions to run after dune's finished.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-17T20:24:23-06:00",
          "tree_id": "3977c19c50aa139dc0a760fa4eb4bfaf8e63eeb3",
          "url": "https://github.com/ocaml/dune/commit/dfa29d3bb507247da3b9c15d8aaa741467d15077"
        },
        "date": 1674009788129,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.43978299247333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "ecd5ce0d462b83370f7da35238fe1b15753d61f9",
          "message": "refactor: invert if statement in action_to_sh (#6896)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-17T20:23:29-06:00",
          "tree_id": "0c84bb31ac6d65a5f887500f21c3113910097bee",
          "url": "https://github.com/ocaml/dune/commit/ecd5ce0d462b83370f7da35238fe1b15753d61f9"
        },
        "date": 1674009980702,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "43.74642050798",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "70e0c6579de48ea10d69fbca04e7026e61c21f52",
          "message": "test: reproduce github 6866 (#6901)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-18T14:56:20-06:00",
          "tree_id": "c5a0d1c79c8a6c74b203027ef3f15903ea80061c",
          "url": "https://github.com/ocaml/dune/commit/70e0c6579de48ea10d69fbca04e7026e61c21f52"
        },
        "date": 1674076750036,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "42.38593950512",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "e9004020dd78762bbdf4bf37248da1c01b51c159",
          "message": "fix: (include_subdirs qualified) and pp (#6902)\n\nTo store the output of ocamldep, we'd choose the following path:\r\n\r\n$obj_dir/$module-basename.$ext.d\r\n\r\nThis scheme doesn't work for (include_subdirs qualified) because base\r\nfilenames are no longer unique.\r\n\r\nWe now choose the file path to be $obj_dir/%module-obj-name.$kind.d\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-19T10:50:49-06:00",
          "tree_id": "4fc078881133e0526b8e27013b62f9099248a88a",
          "url": "https://github.com/ocaml/dune/commit/e9004020dd78762bbdf4bf37248da1c01b51c159"
        },
        "date": 1674148578362,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "42.20826379258",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "415d9c482138c73814abdbbc6d6d53cfde2d35a1",
          "message": "test(rules): include_subdirs qualified (#6903)\n\nTest the case where a single logical module is defined both using a\r\ngroup of modules in a directory and a compilation unit\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-19T13:05:45-06:00",
          "tree_id": "69d6fc5a6549866637d3f9a0fe13414e234c3a63",
          "url": "https://github.com/ocaml/dune/commit/415d9c482138c73814abdbbc6d6d53cfde2d35a1"
        },
        "date": 1674156523934,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.98529872535334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "hugo.heuzard@gmail.com",
            "name": "Hugo Heuzard",
            "username": "hhugo"
          },
          "committer": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "distinct": true,
          "id": "c357cee46f06e2c3c1f3dbbc396c96c12d23e2b3",
          "message": "fix(jsoo): don't ignore linkall\n\nSigned-off-by: Hugo Heuzard <hugo.heuzard@gmail.com>",
          "timestamp": "2023-01-19T18:02:29-06:00",
          "tree_id": "8a05b9fa951495f5a63c41729b5cf7ac9f3e2cd9",
          "url": "https://github.com/ocaml/dune/commit/c357cee46f06e2c3c1f3dbbc396c96c12d23e2b3"
        },
        "date": 1674174449379,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "37.408674639286666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0fe12038a2657ffc9d4ebd9cc28408d591f4f818",
          "message": "chore(nix): update flakes (#6906)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-19T20:37:35-06:00",
          "tree_id": "44e3fec7d0f473317fa309bbfe7a4d0edd2bd394",
          "url": "https://github.com/ocaml/dune/commit/0fe12038a2657ffc9d4ebd9cc28408d591f4f818"
        },
        "date": 1674184325649,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.63375980721333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0d44bbfdb2a68907a464aeb2dabe95388dac5712",
          "message": "fix(rules): include_subdirs qualified stdlib (#6904)\n\n(include_subdirs qualified) is forbidden for libraries with [stdlib]\r\n\r\nWe add a proper error message to reflect that\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-20T14:27:59-06:00",
          "tree_id": "a4649b4df87442097fcc9a7a5c2cb0de99d66ffb",
          "url": "https://github.com/ocaml/dune/commit/0d44bbfdb2a68907a464aeb2dabe95388dac5712"
        },
        "date": 1674247622844,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.29310759821333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "1e49970121c8e6c899b71da02276938f9e32525d",
          "message": "fix(rules): include_subdirs qualified overlap (#6905)\n\n(include_subdirs qualified) cannot handle a directory and a module\r\ncorresponding to the same module path. For example, the module foo.ml\r\nand the module in foo/.\r\n\r\nWe now raise a good error message whenever we encounter this case.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-20T14:58:29-06:00",
          "tree_id": "ad40b5136ed1e6ec76d4a3959f3424c9c8323865",
          "url": "https://github.com/ocaml/dune/commit/1e49970121c8e6c899b71da02276938f9e32525d"
        },
        "date": 1674249448646,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.61184673049333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "1513847d3db43604ca7a3d5c2004928b668e3d92",
          "message": "fix(rules): include_subdirs qualified and unwrapped (#6899)\n\nAllow (include_subdirs unqualified) for libraries that have (wrapped\r\nfalse)\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-20T21:29:05-06:00",
          "tree_id": "76580725842509510913dfabee9d81e53661381d",
          "url": "https://github.com/ocaml/dune/commit/1513847d3db43604ca7a3d5c2004928b668e3d92"
        },
        "date": 1674272888257,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.534778438046665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "distinct": true,
          "id": "fc0769e9319a0dfbf0a1ffca6d0cb4692e2315f4",
          "message": "refactor(coq): reintroduce Value type for coq_config\n\nAs was pointed out in my silly PR getting rid of it, it introduces an\nextra boxing that is unneeded.\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>\n\n<!-- ps-id: 2f6b0e94-1350-446a-810d-bfc6c34ae46e -->",
          "timestamp": "2023-01-21T04:34:29+01:00",
          "tree_id": "58b8d3b3042f12e85aa6b29e044126c480cd7d0b",
          "url": "https://github.com/ocaml/dune/commit/fc0769e9319a0dfbf0a1ffca6d0cb4692e2315f4"
        },
        "date": 1674273163977,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "32.92533258494",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "anmonteiro@gmail.com",
            "name": "Antonio Nuno Monteiro",
            "username": "anmonteiro"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "b2bfb9829b0c7d39a64d0467c0989b7885100831",
          "message": "doc: fix ppxfind link, OCaml typer typo (#6914)\n\nSigned-off-by: Antonio Nuno Monteiro <anmonteiro@gmail.com>",
          "timestamp": "2023-01-21T21:09:32-06:00",
          "tree_id": "225d8b7f6d39e1924f03f38b8c4b25829a101a87",
          "url": "https://github.com/ocaml/dune/commit/b2bfb9829b0c7d39a64d0467c0989b7885100831"
        },
        "date": 1674358095264,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.106447087733336",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "hugo.heuzard@gmail.com",
            "name": "hhugo",
            "username": "hhugo"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "23e09fd8abdc5e14401a7ae6759166ebc5890288",
          "message": "Fix jsoo linkall detection (#6916)\n\nSigned-off-by: Hugo Heuzard <hugo.heuzard@gmail.com>",
          "timestamp": "2023-01-22T20:50:11-06:00",
          "tree_id": "2d80d0e59f44a0a3137f03326f5da3e9662dd016",
          "url": "https://github.com/ocaml/dune/commit/23e09fd8abdc5e14401a7ae6759166ebc5890288"
        },
        "date": 1674443717333,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "37.103589204626665",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "ggreif@gmail.com",
            "name": "Gabor Greif",
            "username": "ggreif"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "e98aa363f26b97172b356055e5d76556204da583",
          "message": "Delete dune~ (#6923)\n\nLing path `test/blackbox-tests/test-cases/jsoo/no-check-prim.t/lib/dune~`\r\nThis was added along #5049 in error.\r\n\r\nSigned-off-by: Gabor Greif <gabor@dfinity.org>",
          "timestamp": "2023-01-23T20:56:08-06:00",
          "tree_id": "73c83fb5b5609d70fe8f6c1d32e2eabb6cd5a2f8",
          "url": "https://github.com/ocaml/dune/commit/e98aa363f26b97172b356055e5d76556204da583"
        },
        "date": 1674530089852,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.296092162633336",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@emillon.org",
            "name": "Etienne Millon",
            "username": "emillon"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "97a9f4620e1d2a802b55f6a22f9de3cb006b06c4",
          "message": "doc: use production lists (#6910)\n\n* doc: use production lists\r\n\r\nInstead of using code blocks, we use sphinx's built-in support for this.\r\nThis looks slightly better but the advantage is that we can use the\r\nfollowing syntax to refer to items:\r\n\r\n    :token:`dep`\r\n\r\nSigned-off-by: Etienne Millon <me@emillon.org>",
          "timestamp": "2023-01-24T17:40:06+01:00",
          "tree_id": "8e534391496fa61550ab395dcf712c2cda6d7345",
          "url": "https://github.com/ocaml/dune/commit/97a9f4620e1d2a802b55f6a22f9de3cb006b06c4"
        },
        "date": 1674579531348,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.72972861526666",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "e+git@x80.org",
            "name": "Emilio Jesús Gallego Arias",
            "username": "ejgallego"
          },
          "distinct": true,
          "id": "ce578be06da8a78655200c56b345ed9e50be9dec",
          "message": "feature(coq): omit -q flag during dune coq top\n\n<!-- ps-id: 5a03ba95-9ec7-41fd-8f3f-db31c6742042 -->\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-24T20:06:05+01:00",
          "tree_id": "8aa397fd502060e8b974203fc4021ea1df2818b5",
          "url": "https://github.com/ocaml/dune/commit/ce578be06da8a78655200c56b345ed9e50be9dec"
        },
        "date": 1674588329840,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.0968027836",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "javier.chavarri@gmail.com",
            "name": "Javier Chávarri",
            "username": "jchavarri"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "e8ad4cd5db8b9b2c6071b91a7b94d81a82ef77f3",
          "message": "melange: add test for warning 102 (#6927)\n\nSigned-off-by: Javier Chávarri <javier.chavarri@gmail.com>",
          "timestamp": "2023-01-24T18:13:25-06:00",
          "tree_id": "cc209d5af17b729ebb0fb02cf8d8ccb8dabd642d",
          "url": "https://github.com/ocaml/dune/commit/e8ad4cd5db8b9b2c6071b91a7b94d81a82ef77f3"
        },
        "date": 1674606766323,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "36.912161040613334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "071d3b13aa83648e8f3daed38c0b704e7d0144cc",
          "message": "test(diagnostics): multiple errors (#6935)\n\nTest multiple errors per compilation unit.\r\n\r\nAt the moment, they are ignored.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-25T17:58:37-06:00",
          "tree_id": "a637b2f73f521c1fd80c4e588d665e83e040688c",
          "url": "https://github.com/ocaml/dune/commit/071d3b13aa83648e8f3daed38c0b704e7d0144cc"
        },
        "date": 1674692551053,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.817644579273335",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "63fd699437e2adedbb3b27d94cdf8893d5f76f88",
          "message": "refactor: Dune_project.encode sanity (#6911)\n\ndune init relies on removing all dialects to make sure the serialized\r\ndune-project file doesn't have any dialects. That is weird because\r\nit explicitly relies on serializition/deserialization not being round trip.\r\n\r\nInstead of relying on this, we change the serializer to stop outputting\r\nthe set of dialects if it's equal to the default.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-26T20:46:05-06:00",
          "tree_id": "c721d5b4e4f04d2f6fef97d647437f9d0c2dbb96",
          "url": "https://github.com/ocaml/dune/commit/63fd699437e2adedbb3b27d94cdf8893d5f76f88"
        },
        "date": 1674788847546,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "39.93612355066667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "9d5bccf72c5e1464473b935c1c280b948308c8d1",
          "message": "refactor(ocamlc_loc): fix lexer formatting (#6941)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-26T20:49:35-06:00",
          "tree_id": "0a32c653389226483f040ce3ecc3d785fd681288",
          "url": "https://github.com/ocaml/dune/commit/9d5bccf72c5e1464473b935c1c280b948308c8d1"
        },
        "date": 1674788862189,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "32.8996740538",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "8e35810f5f1d0cad2c96c8b50ed347834d8ca1be",
          "message": "feature(fiber): reimplement pools (#6814)\n\n* fix weird deadlocks\r\n* add better validation for invariants\r\n* make them a lot faster\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-27T01:14:46-06:00",
          "tree_id": "3aa12afe186392c602ea306fd771d3aef77638a4",
          "url": "https://github.com/ocaml/dune/commit/8e35810f5f1d0cad2c96c8b50ed347834d8ca1be"
        },
        "date": 1674804817764,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.89602029038",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0192f78af51e461b2db1f9fb799779432bfe5d2c",
          "message": "test: diffing of inline tests is not concurrent (#6943)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-27T01:15:38-06:00",
          "tree_id": "99c361cada867d79c4e2752b4f52a6c19f57f0ee",
          "url": "https://github.com/ocaml/dune/commit/0192f78af51e461b2db1f9fb799779432bfe5d2c"
        },
        "date": 1674805079265,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "41.230985101593326",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "b9a8c9955ddd782a1d0a715bfd95ef2f8ae355b4",
          "message": "refactor(rules): unwrapped module layout (#6915)\n\nAdd type safety to the representation of (wrapped false) in the module\r\nlayout\r\n\r\nSuch a layout differs from (wrapped false) in that it never has top\r\nlevel module alias or toplevel interface module\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-27T10:19:18-06:00",
          "tree_id": "a93852a4ef4742e29746292346b214e5a470f17f",
          "url": "https://github.com/ocaml/dune/commit/b9a8c9955ddd782a1d0a715bfd95ef2f8ae355b4"
        },
        "date": 1674837461411,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.58693242094",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "ed14f7afa3500c0c907f0a3c8d27007664a9d658",
          "message": "test(rules): more alias module tests (#6924)\n\nTest the generated alias module for implementations of virtual libraries\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-27T10:20:56-06:00",
          "tree_id": "43f649ead5c93850817ea9f48ef5ae476a5817ce",
          "url": "https://github.com/ocaml/dune/commit/ed14f7afa3500c0c907f0a3c8d27007664a9d658"
        },
        "date": 1674837847441,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "43.5911258433",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "a41ab22afb1c964c40ef80c2affa0d4d403dca69",
          "message": "fix(rpc): bidirectional communication (#6801)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-27T11:22:16-06:00",
          "tree_id": "0520e55fe6b67240a31db91abafd66da7b533b50",
          "url": "https://github.com/ocaml/dune/commit/a41ab22afb1c964c40ef80c2affa0d4d403dca69"
        },
        "date": 1674841251576,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "34.03494551802667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "3120c2e3adc9269d992ad21a68dfd952c4417995",
          "message": "remove fiber from public libraries (#6925)\n\nUndo a mistake a long time ago. Instead of releasing it from inside\r\ndune, this library will be released from a separate repository.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-27T11:32:41-06:00",
          "tree_id": "13e21754042167d72ef02f07e2bfd08266509d41",
          "url": "https://github.com/ocaml/dune/commit/3120c2e3adc9269d992ad21a68dfd952c4417995"
        },
        "date": 1674842105213,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "42.57085165099334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "javier.chavarri@gmail.com",
            "name": "Javier Chávarri",
            "username": "jchavarri"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "bbcf9c97643ed0b9b3c4ad520ed225d01ebab10a",
          "message": "melange: test demonstrating issue with copy_files (#6946)\n\nSigned-off-by: Javier Chávarri <javier.chavarri@gmail.com>",
          "timestamp": "2023-01-27T12:23:32-06:00",
          "tree_id": "e86b1c259b0fd30156d97c26d117288063357687",
          "url": "https://github.com/ocaml/dune/commit/bbcf9c97643ed0b9b3c4ad520ed225d01ebab10a"
        },
        "date": 1674845273740,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "41.83956761713333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "8484dd9f7b76207d760cf3e4218f5e17c488bec6",
          "message": "chore: move fiber tests to fiber/ (#6948)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-27T15:22:58-06:00",
          "tree_id": "3e3b353b9dd9e9b7b1fe944d8d16dbfdb26e7150",
          "url": "https://github.com/ocaml/dune/commit/8484dd9f7b76207d760cf3e4218f5e17c488bec6"
        },
        "date": 1674856028102,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "45.43961700963333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "3607e08da44f13c4962114d671a496f9febec350",
          "message": "refactor: Ml_source.modules_of_obj_dir improve error (#6951)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-27T16:27:59-06:00",
          "tree_id": "a3b0a8540bdd88eb416fc07929f9056efa8c3d3a",
          "url": "https://github.com/ocaml/dune/commit/3607e08da44f13c4962114d671a496f9febec350"
        },
        "date": 1674859595356,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.29599071899333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "corentin.leruth@gmail.com",
            "name": "Corentin Leruth",
            "username": "tatchi"
          },
          "committer": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "distinct": true,
          "id": "7698307cb825194b7abefabc74590d5e03276e40",
          "message": "fix: parsing of <= operator\n\nSigned-off-by: Corentin Leruth <corentin.leruth@gmail.com>",
          "timestamp": "2023-01-27T20:39:00-06:00",
          "tree_id": "114473d5c929244760560412490c1487bfd9c987",
          "url": "https://github.com/ocaml/dune/commit/7698307cb825194b7abefabc74590d5e03276e40"
        },
        "date": 1674874895051,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "43.56389777456667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "fb16b363f57343f655b0ff7695f2b79ac44930fa",
          "message": "test: add example of error message that is not parsed (#6934)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-27T22:07:32-06:00",
          "tree_id": "6791f3505a8688e4c2812aebd21057de1beb5cdb",
          "url": "https://github.com/ocaml/dune/commit/fb16b363f57343f655b0ff7695f2b79ac44930fa"
        },
        "date": 1674879959278,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.83711165709333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "hugo.heuzard@gmail.com",
            "name": "Hugo Heuzard",
            "username": "hhugo"
          },
          "committer": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "distinct": true,
          "id": "86bc1bf844591e41e84b98baca387c523628512b",
          "message": "feature(jsoo): recognize toplevel variant\n\nSigned-off-by: Hugo Heuzard <hugo.heuzard@gmail.com>",
          "timestamp": "2023-01-27T22:17:59-06:00",
          "tree_id": "0d27129d8ce2acff4218972523941bafff3d9ba5",
          "url": "https://github.com/ocaml/dune/commit/86bc1bf844591e41e84b98baca387c523628512b"
        },
        "date": 1674880578085,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.13476247242",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "3e27f8f2ebdc959ffac1a806e19062c214326e0b",
          "message": "chore: update pp and remove redundant tests (#6954)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-27T23:07:35-06:00",
          "tree_id": "9c1a8a5afd1c167cda3c02fd0848c2e731d3a94f",
          "url": "https://github.com/ocaml/dune/commit/3e27f8f2ebdc959ffac1a806e19062c214326e0b"
        },
        "date": 1674883565812,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.191898454193336",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "71855677+jonahbeckford@users.noreply.github.com",
            "name": "jonahbeckford",
            "username": "jonahbeckford"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "529d9c0cd43e2c9e0ed3c616511df404cc0c0109",
          "message": "Add 4.14.0 MSVC to CI (#6917)\n\n* Rename MSVC CI to MSVC 4.12.1 CI\r\n* Add MSVC 4.14.0 CI\r\n\r\nSigned-off-by: Jonah Beckford <71855677+jonahbeckford@users.noreply.github.com>",
          "timestamp": "2023-01-28T12:07:45+01:00",
          "tree_id": "1721b778f66849bc348c8b534daaf960c6c55589",
          "url": "https://github.com/ocaml/dune/commit/529d9c0cd43e2c9e0ed3c616511df404cc0c0109"
        },
        "date": 1674905174299,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "32.80608844677334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "alizter@gmail.com",
            "name": "Ali Caglayan",
            "username": "Alizter"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "0e863c4d53d6d209d54a2fd4e50609b08726a53b",
          "message": "chore: move stdune tests to stdune/ (#6949)\n\nSigned-off-by: Ali Caglayan <alizter@gmail.com>",
          "timestamp": "2023-01-28T11:28:23-06:00",
          "tree_id": "f469b5b78b883707538ef55d66ba0a95e428b290",
          "url": "https://github.com/ocaml/dune/commit/0e863c4d53d6d209d54a2fd4e50609b08726a53b"
        },
        "date": 1674928030123,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.94107106030667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "e99fbd1432ca82485ec025798ba2d4bdedc1bd7d",
          "message": "test(melange): fix copy-files-lib test (#6952)\n\n* Refer to to artifacts using %{project_root}\r\n* Add dependency for the melange alias on the target rather than the\r\n  dependency\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-28T11:27:11-06:00",
          "tree_id": "e80bee0ab3bc5d2d6f9504686e4fc23b6e09d318",
          "url": "https://github.com/ocaml/dune/commit/e99fbd1432ca82485ec025798ba2d4bdedc1bd7d"
        },
        "date": 1674928157922,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "40.54274793360667",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "5642908a96e53f3f4b507ad1b73d43f71a5187b0",
          "message": "refactor(rules): workspace improvements (#6957)\n\n* Improve the [to_dyn] functions\r\n* Rename [t] to [decode] as in the rest of the code base\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-28T17:10:00-06:00",
          "tree_id": "8d67554bb693a760eb6cc1775a45fc38e04a2b4d",
          "url": "https://github.com/ocaml/dune/commit/5642908a96e53f3f4b507ad1b73d43f71a5187b0"
        },
        "date": 1674948491000,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "32.642195425513336",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "f65bbb4cca33b2d89a1b82353d510e6ae5caedfc",
          "message": "test(rules): reproduce #6843 (#6956)\n\nCross compilation setup causes dune to crash\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-28T17:10:24-06:00",
          "tree_id": "5727b3239b05587ae559e2738f169341cd8822c2",
          "url": "https://github.com/ocaml/dune/commit/f65bbb4cca33b2d89a1b82353d510e6ae5caedfc"
        },
        "date": 1674948792009,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "42.0848505679",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "javier.chavarri@gmail.com",
            "name": "Javier Chávarri",
            "username": "jchavarri"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "714626f4d408e5c71c24ba91d0d520588702ec52",
          "message": "melange: clean up copy_files tests (#6955)\n\nSigned-off-by: Javier Chávarri <javier.chavarri@gmail.com>",
          "timestamp": "2023-01-29T11:13:39-06:00",
          "tree_id": "91a962ec8da8f8a5b29a1f6eef03dd4341dfbb67",
          "url": "https://github.com/ocaml/dune/commit/714626f4d408e5c71c24ba91d0d520588702ec52"
        },
        "date": 1675013532412,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.77530272876",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "eb6479bd19035fa935acb4cdd28c78e40ad63445",
          "message": "refactor(rules): modify generated source name (#6922)\n\nWe choose the source name of generated files to be basesd on the object\r\nname rather than the module name.\r\n\r\nWith (include_subdirs qualified), it's easy to generate a source name\r\nthat will collide with anothera generated module's name.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-29T15:45:38-06:00",
          "tree_id": "66777bba163b2eafc5d842b26974cc0e7a36ecb1",
          "url": "https://github.com/ocaml/dune/commit/eb6479bd19035fa935acb4cdd28c78e40ad63445"
        },
        "date": 1675030412288,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.27628809563999",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "a3280fb900fec7fa6ef570be17441223844ab4b8",
          "message": "chore(engine): Add [Rules.to_dyn] (#6964)\n\nuseful for printf debugging\r\n\r\nalso rename [data_to_dyn] to [dyn_of_data] to match our convention\r\nelsewhere.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-29T18:53:10-06:00",
          "tree_id": "4d475732d140d5125561a69ca0003e12029fd965",
          "url": "https://github.com/ocaml/dune/commit/a3280fb900fec7fa6ef570be17441223844ab4b8"
        },
        "date": 1675041418395,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "44.2109693038",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "d5fa2d35a4ebace945d34cb574d5f06c7223c8ea",
          "message": "chore(nix): update flakes (#6965)\n\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-29T22:49:33-06:00",
          "tree_id": "045856cec0df3cbcd33427a7bfdd94ad83241f02",
          "url": "https://github.com/ocaml/dune/commit/d5fa2d35a4ebace945d34cb574d5f06c7223c8ea"
        },
        "date": 1675055290543,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "33.79529655743334",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "4eb93fddd3031bfa6fc5bc69b9ca4811e4aed650",
          "message": "fix(rules): canonical paths in aliases (#6963)\n\nThe canonical paths were all wrong for modules with (include_subdirs\r\nqualified). This PR addresses the problem.\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-30T00:46:29-06:00",
          "tree_id": "0b3fdec684b050ac3aab97dba47893f9695c9811",
          "url": "https://github.com/ocaml/dune/commit/4eb93fddd3031bfa6fc5bc69b9ca4811e4aed650"
        },
        "date": 1675062336972,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "35.06499752475333",
            "unit": "seconds"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "me@rgrinberg.com",
            "name": "Rudi Grinberg",
            "username": "rgrinberg"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "ab455e3365e55d6ddcf1664a1aa95d24ed338660",
          "message": "fix(rules): cross compilation bug (#6958)\n\nIt's possible for a context with targets to be a cross compilation\r\ncontext for other contexts. Previously, we'd assume that wasn't the\r\ncase.\r\n\r\nfixes #6843\r\n\r\nSigned-off-by: Rudi Grinberg <me@rgrinberg.com>",
          "timestamp": "2023-01-30T09:57:19-06:00",
          "tree_id": "6a7a044a113528aeedf2f52e565b6319f88ca4f1",
          "url": "https://github.com/ocaml/dune/commit/ab455e3365e55d6ddcf1664a1aa95d24ed338660"
        },
        "date": 1675095406288,
        "tool": "customSmallerIsBetter",
        "benches": [
          {
            "name": "pupilfirst build time (Linux)",
            "value": "37.165515788",
            "unit": "seconds"
          }
        ]
      }
    ]
  }
}