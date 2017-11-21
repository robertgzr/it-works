GOOS := linux
GOARCH := amd64

build_cmd := 

all: go hab

go:
	sh -c "cd src/ && GOOS=$(GOOS) GOARCH=$(GOARCH) CGO_ENABLED=0 \
		go build -ldflags '-extldflags \"-static\"' \
		-o ../artifacts/it_works_$(GOOS)_$(GOARCH)"

hab:
	hab pkg build .
