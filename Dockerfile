FROM golang:alpine AS builder
ADD . /src
RUN apk --no-cache update && apk --no-cache add git make

ENV GOOS=linux
ENV GOARCH=amd64
RUN cd /src && make go

# and the deploy container
FROM scratch

COPY --from=builder \
    /src/artifacts/it-works_linux_amd64 \
    /bin/it-works
COPY --from=builder \
    /etc/ssl/certs/ca-certificates.crt \
    /etc/ssl/certs/ca-certificates.crt

EXPOSE 80

WORKDIR "/"
ENTRYPOINT ["/bin/it-works"]
CMD ["-port", "80", "-msg", "it works :)"]