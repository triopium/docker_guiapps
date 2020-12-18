#!/bin/bash
IMAGE_NAME="egui"
CONTAINER_NAME="eguic"
CFG_VOLUME="${CONTAINER_NAME}_vol"
MYVOL="~/mytestdocker"
RGROUPS=$(groups | tr ' ' ,)

# Clear up
docker container rm $CONTAINER_NAME

# Get security xauth cookie
tok=$(xauth list | grep $HOSTNAME | awk '{printf $3}')

# Create/attach volume
docker volume create "$CFG_VOLUME"

# build image
docker build --no-cache=true -f df_testuser -t $IMAGE_NAME .

docker run -ti \
 -v myemacs:/root/.emacs.d/ \
 -v /tmp/.X11-unix \
 -v "${HOME}/mytestvolume" \
 -v $HOME/tmp:$HOME \
 -e RUID=1000 \
 -e RUSER=jk \
 --name $CONTAINER_NAME \
 $IMAGE_NAME bash
