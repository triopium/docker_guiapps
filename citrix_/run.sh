#!/bin/bash
#docker-compose run -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native firefox-music ash
function firefoxstart(){
	docker-compose run -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native "$1" ash
}

firefoxstart $1
