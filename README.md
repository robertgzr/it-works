# it_works

This is testing/demo application. 

Included are:

* `src/`: source code, see `src/`
* `artifacts/`: statically linked binary for Linux x86_64
* `habitat/plan.sh`: plan file used by [Habitat](github.com/habitat-sh/habitat)

## Habitat Pkg

The Habiat package is built without compiling the actual source code.
We just package the binary from `artifacts` to stay build dependency free.
