FROM golang:alpine AS builder

RUN apk --no-cache add -U \
        git \
        make

COPY . /src

WORKDIR /src
