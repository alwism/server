#!/usr/bin/env sh
echo "Docker Run"
if [ "${1}" = "prod" ];then
  docker run "${IMAGE_NAME}:release-latest" >&2
else
  docker run "${IMAGE_NAME}:debug-latest" >&2
fi
