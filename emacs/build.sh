#!/bin/bash
IMAGE_NAME=timage
CONTAINER_NAME="emacs_${USER}"
# remove old container
docker container rm $CONTAINER_NAME

# BUILD IMAGE
# --no-cache \
DOCKER_BUILDKIT=1 docker build \
			 --progress=plain \
       -f emacsd \
       -t $IMAGE_NAME \
       --build-arg MY_UID=$(id -u) \
       --build-arg MY_GID=$(id -g) \
       --build-arg MY_GROUP=$(id -g -n) \
       --build-arg MY_USER=$USER .
