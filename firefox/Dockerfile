FROM alpine as mybaseimage

# XAUTH ENV
ENV DISP :1
ENV TOK mytoken

ARG APP_NAME
ARG MY_USER
ARG MY_GROUP
ARG MY_UID
ARG MY_GID
ENV DEBUG_MODE=false
WORKDIR /home/$MY_USER/

## Create non-root user
RUN addgroup -g $MY_GID $MY_GROUP && \
	adduser -u $MY_UID $MY_USER -G $MY_GROUP -D && \
	adduser $MY_USER audio 

RUN apk update && \
	apk upgrade && \
	apk add firefox-esr \
	ttf-freefont \
	pulseaudio \
	alsa-utils

FROM mybaseimage
RUN apk add \
    dbus-x11 \
    mesa-gl \
    mesa-dri-swrast
    # dumb-init \

USER  $MY_USER
