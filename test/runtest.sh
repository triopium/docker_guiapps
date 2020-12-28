#!/bin/bash
IMAGE_NAME=timage
CONTAINER_NAME=tcont
echo $(id -u), $USER
# remove old container
docker container rm $CONTAINER_NAME
docker build \
       -f testbuild \
       -t $IMAGE_NAME \
       --build-arg MY_UID=$(id -u) \
       --build-arg MY_USER=$USER .

docker run -ti \
       -u $(id -u) \
       -v $HOME/tmp:$HOME/hf/ \
       $IMAGE_NAME bash 
