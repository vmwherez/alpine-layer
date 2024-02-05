#!/bin/sh 

# system 
apk add openrc wget curl python3 zsh git shadow
# apk add rustup go 

# antigen
curl -L git.io/antigen > antigen.zsh

# editing and compiling
apk add make cmake gcc clang nano

# TODO vim

# debugging
apk add valgrind radare2

# GEF (gdb enhanced features)  
# https://github.com/hugsy/gef
# file is required
apk add file gdb
wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit

# network 
apk add bind-tools net-tools openssh tmux

# sound
apk add pulseaudio-alsa alsa-plugins-pulse alsa-lib-dev pulseaudio

# docs
apk add mandoc man-pages docs most

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

