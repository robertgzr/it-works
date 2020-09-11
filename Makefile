DOCKER ?= docker

it-works:
	DOCKER_BUILDKIT=1 \
	$(DOCKER) build --platform=linux/amd64 --target=it-works --tag robertgzr/it-works:latest .

idle:
	DOCKER_BUILDKIT=1 \
	$(DOCKER) build --platform=linux/amd64 --target=idle --tag robertgzr/it-works:idle .
