# it_works

This is a testing/demo application. 

Included are:

* `src/`: source code, see `src/`
* `artifacts/`: statically linked binary for Linux x86_64
* `habitat/plan.sh`: plan file used by [Habitat](github.com/habitat-sh/habitat)

## Habitat Pkg

The Habiat package is built without compiling the actual source code.
We just package the binary from `artifacts` to stay build dependency free.

```
vagrant up
sudo su -
cd /src
make hab-build
```

To generate a k8s deployment that can be run with [habitat-operator](https://github.com/kinvolk/habitat-operator):

```
# saves to manifest.yaml
make hab-export
```
