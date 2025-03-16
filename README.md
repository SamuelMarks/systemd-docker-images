systemd-docker-images
=====================
![GitHub License](https://img.shields.io/github/license/SamuelMarks/systemd-docker-images)

Docker images with systemd setup.

## Build

    NAME='samuelmarks/systemd' IMAGE_BASE=debian IMAGE_TAG='stable-slim'; podman build --file 'systemd/debian.dockerfile' --progress='plain' --no-cache --build-arg IMAGE_BASE="${IMAGE_BASE}" --build-arg IMAGE_TAG="${IMAGE_TAG}" --tag "${NAME}":"${IMAGE_BASE}"'__'"${IMAGE_TAG}" .

(`docker` may work for you; `docker` doesn't but [`podman`](https://podman.io) works for me on macOS with ARM64.)

## Run

    NAME='samuelmarks/systemd' IMAGE_BASE=debian IMAGE_TAG='stable-slim'; podman run -it --name 'run__systemd__'"${IMAGE_BASE}"'__'"${IMAGE_TAG}" "${NAME}":"${IMAGE_BASE}"'__'"${IMAGE_TAG}" /bin/bash
