#!/usr/bin/env sh
echo "Rust Build"
if [ "${1}" = "prod" ];then
  cargo build --release >&2
else
  cargo build >&2
fi

echo "Docker Build"
docker build docker/. -t "${IMAGE_NAME}"