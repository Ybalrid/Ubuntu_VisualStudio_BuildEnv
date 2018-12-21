#!/bin/bash

echo "This is an environement installation script for Ubuntu made to automate the installation of a C++ developement environement"
if [ "$(id -u)" != "0" ]; then
	echo "Run me as root please :3"
	exit 1
fi


#small post-install cleanup
apt autoremove			-y
apt update			-y
apt upgrade			-y
apt install			-y \
	neofetch \
	build-essential \
	neovim \
	cmake \
	libsdl2-dev \
	git \
	git-lfs \
	mercurial \
	clang \
	lldb \
	valgrind \
	cppcheck \
	ninja-build \
	clang-format \
	libboost-all-dev \
	autoconf \
	openssh-server \
	xxgdb \
	ddd \
	cgdb \
	radare2 \
	python-pip \
	cowsay \
	curl \
	xterm \
	software-properties-common \
	apt-transport-https \
	wget \

#visual studio code, just in case you want to liveshare
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update 	-y
apt install 	-y	code

echo "starting/enabling ssh server for visual studio remote debuging"
systemctl start ssh
systemctl enable ssh

echo "install gdbgui via pip"
pip install gdbgui

echo "done installing. - don't forget to configure git global name/mail"
neofetch
cowsay "Happy hacking!"

