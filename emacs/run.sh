#!/bin/bash

function emacsstart(){
	docker-compose run -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native "$1" bash
}

emacsstart $1
