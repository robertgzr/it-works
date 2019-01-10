all: go

go:
	CGO_ENABLED=0 go build -i --ldflags="-s" -o artifacts/it-works_$(shell go env GOOS)_$(shell go env GOARCH)$(shell go env GOARM) ./src

clean:
	git clean -fdx
