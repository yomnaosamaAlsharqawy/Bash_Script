#! /usr/bin/bash

read -p "enter 1st number:" num1
read -p "enter 2nd number:" num2

multiplication(){
	local res=$((num1 * num2))
	echo "$res"
	echo "result: $num1 * $num2 = $res "
}

multiplication
