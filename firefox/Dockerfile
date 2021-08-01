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
	adduser -u $MY_UID $MY_USER -G $MY_GROUP -D

# alsa audio
RUN adduser $MY_USER audio

RUN apk add firefox-esr

FROM mybaseimage
RUN apk add pulseaudio
RUN apk add --no-cache \
    dbus-x11 \
    dumb-init \
    firefox-esr \
    mesa-gl \
    mesa-dri-swrast \
    ttf-freefont

RUN apk add alsa-utils
RUN apk add vlc

USER  $MY_USER
