#! /usr/bin/bash

read -p "install curl enter Y/N: " option

if [ "$option" = 'Y' ]
then 
	echo "installing package .."
	sudo dnf  install curl -y
	echo "$(which crul)"
	echo "$(curl --version)"
else
	echo "not installed"

fi
