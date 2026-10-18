#! /usr/bin/bash

echo "system information"
read -p "Display system information enter Y/N: " option

if [ "$option" = 'Y' ]
then 
	echo "current username: $(whoami)"
	echo "Hostname : $(hostname)"
	echo "Available disk space: $(df -h | awk 'NR==5 {print $4}')"
	echo "Overall system uptime: $(uptime -p)"

else
	echo "action cancelled"
fi
