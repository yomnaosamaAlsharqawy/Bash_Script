#! /usr/bin/bash

read -p "please enter your age:" age
if [ "$age" -ge 18 ]
then
	echo "You are eligible to vote."
else
	echo "You are not eligible to vote yet."
fi
echo "end of code"
