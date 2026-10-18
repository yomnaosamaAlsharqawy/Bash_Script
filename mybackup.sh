#! /usr/bin/bash

read -p "need to take backup for your files Y/N": option

if [ "$option" = 'Y' ]
then
#	all_files = $( ls | grep '\.txt$' )
	
	for i in $( ls | grep '\.txt$' ) ; do
		cp "$i" ~/shell_scripts/backup/"$i".bak
	done
	echo "backup completed"
else 
	echo "backup cancelled"
fi
