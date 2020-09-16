# go env args
ARG GO_VERSION=1.15
# build related args
ARG BUILD_BIN
ARG BUILD_FLAGS="-v"
ARG BUILD_DEPS
# test related flags
ARG TEST_FLAGS="-v"
# deploy related flags
ARG DEPLOY_CMD
ARG DEPLOY_DEPS

FROM golang:${GO_VERSION}-alpine AS devimg
ARG BUILD_DEPS
RUN apk add --no-cache ${BUILD_DEPS}

FROM devimg AS build
COPY . /src/
ARG BUILD_BIN
ARG BUILD_FLAGS
RUN set -ex; cd /src || exit 1; go build ${BUILD_FLAGS} -o /bin/${BUILD_BIN} ./cmd/${BUILD_BIN}

FROM devimg AS test
COPY . /src/
WORKDIR /src
ARG TEST_FLAGS
ENV TEST_FLAGS="${TEST_FLAGS}"
CMD [ "sh", "-c", "--", "go test ${TEST_FLAGS} ./..." ]

FROM alpine:3.12 AS deploy
ARG DEPLOY_DEPS
RUN apk add --no-cache ${DEPLOY_DEPS}
ARG BUILD_BIN
COPY --from=build /bin/${BUILD_BIN} /usr/local/bin/${BUILD_BIN}
ARG DEPLOY_CMD=
ENV DEPLOY_CMD="${DEPLOY_CMD}"
CMD ${DEPLOY_CMD}
