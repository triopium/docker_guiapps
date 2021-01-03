#!/bin/bash
docker cp ./emacs.d/straightcfg.el "emacs_${USER}":"$HOME/.emacs.d/"
