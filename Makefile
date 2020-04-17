
it-works:
	DOCKER_BUILDKIT=1 \
	$(DOCKER) build --platform=linux/amd64 --target=it-works --tag robertgzr/it-works .

