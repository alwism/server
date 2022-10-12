#!/usr/bin/env sh
echo "Docker Run"
if [ "${1}" = "prod" ];then
    docker run \
    --rm \
    --env-file="./config/.env" \
    -v "/var/run/docker.sock:/var/run/docker.sock" \
    "${IMAGE_NAME}:release-latest" \
    >&2
else
  docker run \
    --rm \
    --env-file="./config/.env" \
    -v "/var/run/docker.sock:/var/run/docker.sock" \
    "${IMAGE_NAME}:debug-latest" \
    >&2
fi
