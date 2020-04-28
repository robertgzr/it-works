# syntax=docker/dockerfile:1.1-experimental
# vim: ft=dockerfile

FROM --platform=$BUILDPLATFORM tonistiigi/xx:golang AS xgo
FROM --platform=$BUILDPLATFORM golang:alpine AS gobuild
COPY --from=xgo / /
ARG TARGETPLATFORM
WORKDIR /src
RUN --mount=target=. \
    --mount=target=/go/pkg,type=cache \
    --mount=target=/root/.cache,type=cache \
    CGO_ENABLED=0 \
    go build \
        -tags "netgo osusergo static_build" \
        -ldflags "-s -w -extldflags -static" \
        -o /out/it-works-$(echo $TARGETPLATFORM | sed 's/\//-/g') \
        ./src

FROM --platform=$TARGETPLATFORM alpine AS base

ARG MAINTAINER="robertgzr <r@gnzler.io>"
LABEL \
        maintainer=$MAINTAINER \
        org.opencontainers.image.authors=$MAINTAINER \
        org.opencontainers.image.title="it-works" \
        org.opencontainers.image.source="https://github.com/robertgzr/it-works"

FROM base AS it-works
COPY --from=gobuild /out/it-works-$(echo $TARGETPLATFORM | sed 's/\//-/g') /usr/local/bin/it-works
RUN apk add --update-cache --no-cache ca-certificates
EXPOSE 80
ENTRYPOINT ["it-works"]
CMD ["-port", "80"]

FROM base AS idle
RUN apk add --update-cache --no-cache stress-ng
ENV \
    STRESS_ENABLED="false" \
    STRESS_ARGS="--cpu=2 --vm=2 --io=2 --tz" \
    STRESS_TIMEOUT="30s" \
    IDLE_INTERVAL="5m"
COPY ./idle/start.sh /usr/local/bin/
CMD ["start.sh"]
