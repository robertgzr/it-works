#!/bin/sh
set -e
[ -n "$DEBUG" ] && set -x

HERE="$(dirname "$(readlink -f -- "$0")")"

stack="$(faq -r '.stack' "${HERE}/repo.yml")"
if [ ! "${stack}" = "go-module" ]; then
	exit 1
fi

if [ ! -e "${HERE}/go.mod" ]; then
	exit 1
fi

# this is a go module
# 1. get opts from repo.yml
# 2. generate Dockerfile, composefiles and add release section to repo.yml
