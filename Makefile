GOOS := linux
GOARCH := amd64

all: go hab

go:
	GOOS=$(GOOS) GOARCH=$(GOARCH) CGO_ENABLED=0 \
	     go build \
	     -ldflags '-extldflags "-static"' \
	     -o artifacts/it_works_$(GOOS)_$(GOARCH)

hab:
	hab pkg build .
