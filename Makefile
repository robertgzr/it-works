GOOS=linux
GOARCH=amd64
all: go hab

go:
	GOOS=$(GOOS) GOARCH=$(GOARCH) CGO_ENABLED=0 go build -i --ldflags="-s" -o artifacts/it-works_$(GOOS)_$(GOARCH) ./src

hab: hab-build hab-upload hab-export
hab-build:
	hab pkg build .
hab-upload:
	hab pkg upload results/robertgzr-it-works-*-x86_64-linux.hart
hab-export:
	HAB_PKG_EXPORT_KUBERNETES_PKG_IDENT=robertgzr/hab-pkg-export-kubernetes \
		hab pkg export kubernetes robertgzr/it-works \
		-o manifest.yml

clean:
	git clean -fdx
