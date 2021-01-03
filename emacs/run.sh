#!/bin/bash
IMAGE_NAME=timage
CONTAINER_NAME="emacs_${USER}"
# remove old container
docker container rm $CONTAINER_NAME

# BUILD IMAGE
       # --no-cache \
docker build \
       -f emacsd \
       -t $IMAGE_NAME \
       --build-arg MY_UID=$(id -u) \
       --build-arg MY_GID=$(id -g) \
       --build-arg MY_GROUP=$(id -g -n) \
       --build-arg MY_USER=$USER .

# INSTANTIATE CONTAINER
       # -v /tmp/.X11-unix \
       # --env="DISPLAY" \
tok=$(xauth list | grep $HOSTNAME | awk '{printf $3}')
docker run -ti \
       --net=host \
       --env="DISPLAY" \
       --env="USER" \
       -u $(id -u)  \
       -e DISP="$DISPLAY" \
       -e XTOK="$tok" \
       --name "$CONTAINER_NAME" \
       -v "$HOME/tmp":"$HOME/wd/" \
       -v "$HOME/Dop/docker_guiapps/emacs/emacs.d/straight_data":"$HOME/.emacs.d/straight/" \
       "$IMAGE_NAME" bash

       # -v "$HOME/Dop/emacs/emacs.d/straight":"$HOME/.emacs.d" \
