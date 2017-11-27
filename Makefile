GOOS := linux
GOARCH := amd64

build_cmd := 

all: go hab

go:
	sh -c "cd src/ && GOOS=$(GOOS) GOARCH=$(GOARCH) CGO_ENABLED=0 \
		go build -ldflags '-extldflags \"-static\"' \
		-o ../artifacts/it_works_$(GOOS)_$(GOARCH)"

hab-build:
	hab pkg build .
hab-export:
	HAB_PKG_EXPORT_KUBERNETES_PKG_IDENT=robertgzr/hab-pkg-export-kubernetes \
		hab pkg export kubernetes robertgzr/it_works \
		-o manifest.yml

clean:
	git clean -fdx
