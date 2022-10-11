#!/usr/bin/env sh
echo "Docker Build"
DOCKER_BUILDKIT=1 docker build . --no-cache --file docker/dockerfile --target release -t "${IMAGE_NAME}:release-latest" -t "${IMAGE_NAME}:release-$(git rev-parse --short HEAD)" >&2
DOCKER_BUILDKIT=1 docker build . --no-cache --file docker/dockerfile --target debug -t "${IMAGE_NAME}:debug-latest" -t "${IMAGE_NAME}:debug-$(git rev-parse --short HEAD)" >&2
