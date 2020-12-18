#!/bin/bash
IMAGE_NAME="egui"
CONTAINER_NAME="eguic"
CFG_VOLUME="${CONTAINER_NAME}_vol"

# remove old container
docker container rm $CONTAINER_NAME

# Get security xauth cookie
tok=$(xauth list | grep $HOSTNAME | awk '{printf $3}')

# Create/attach volume
docker volume create "$CFG_VOLUME"

# Build image
# docker build --no-cache -f df_emacs -t $IMAGE_NAME .
docker build -f df_emacs -t $IMAGE_NAME .
# docker build --no-cache=true -f df_emacs -t $IMAGE_NAME .

# -v $HOME/:$HOME/host/ \
# -v myemacs:$HOME/.emacs.d/ \
# Run container
docker run -ti \
       --net=host \
       --env="DISPLAY" \
 -v /tmp/.X11-unix \
 -e RUID="$(id -u)" \
 -e RUSER="$USER" \
 -e DISP=$DISPLAY \
 -e TOK="$tok" \
 --name $CONTAINER_NAME \
 -u $(id -u) \
 $IMAGE_NAME

 # -v $HOME/Gop/:$HOME/Gop/ \
