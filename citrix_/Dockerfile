FROM ubuntu:18.04 as mybaseubuntu18
# ENV DISP :1
# ENV TOK mytoken
# RUN apt-get -y update \
	# && DEBIAN_FRONTEND=noninteractive \
	# apt-get -y \
	# --no-install-recommends \
	# install \
	# ca-certificates \
	# xauth \
	# firefox \
	# dbus-x11

ENV DISP :1
ENV TOK mytoken

ARG APP_NAME
ARG MY_USER
ARG MY_GROUP
ARG MY_UID
ARG MY_GID
ENV DEBUG_MODE=false

RUN groupadd -g $MY_GID $MY_USER && \
		adduser --uid $MY_UID --gid $MY_GID $MY_USER

RUN apt-get -y update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get -y  \
	--no-install-recommends \
	install \
	ca-certificates \
	xauth \
	emacs

RUN useradd -m -s /bin/bash -G sudo -u 2000 maker -p "$(openssl passwd -1 hello)"

FROM mybaseubuntu18
# RUN adduser $MY_USER input
USER $MY_USER
WORKDIR /home/$MY_USER

