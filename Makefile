GOOS=linux
GOARCH=amd64
all: go hab

go:
	GOOS=$(GOOS) GOARCH=$(GOARCH) CGO_ENABLED=0 go build -i --ldflags="-s" -o artifacts/it-works_$(GOOS)_$(GOARCH) ./src

clean:
	git clean -fdx
