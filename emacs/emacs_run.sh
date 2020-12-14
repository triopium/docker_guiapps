#!/bin/sh
#echo PassingVars: display=$DISPLAY , $tok

tok=$(xauth list | grep $HOSTNAME | awk '{printf $3}')
docker build --no-cache=true -f e2 -t egui .
# docker run -ti --net=host --env="DISPLAY" -e DISP="$DISPLAY" -e TOK="$tok" -v /tmp/.X11-unix egui "xauth add $DISP . $TOK && sh"
#docker run -ti --net=host --env="DISPLAY" -e DISP="$DISPLAY" -e TOK="$tok" -v /tmp/.X11-unix egui sh
docker run -ti --net=host --env="DISPLAY" -e DISP="$DISPLAY" -e TOK="$tok" -v /tmp/.X11-unix egui sh
