#!/bin/bash
IMAGE_NAME=timage
CONTAINER_NAME="emacs_${USER}"
# remove old container
docker container rm $CONTAINER_NAME

# build image
       # --no-cache \
docker build \
       -f emacsd \
       -t $IMAGE_NAME \
       --build-arg MY_UID=$(id -u) \
       --build-arg MY_USER=$USER .

# instantiate container
tok=$(xauth list | grep $HOSTNAME | awk '{printf $3}')
docker run -ti \
       --net=host \
       --env="DISPLAY" \
       -v /tmp/.X11-unix \
       -u $(id -u)  \
       -e DISP=$DISPLAY \
       -e XTOK="$tok" \
       --name $CONTAINER_NAME \
       -v $HOME/tmp:$HOME/hf/ \
       $IMAGE_NAME bash 
