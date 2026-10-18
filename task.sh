#! /usr/bin/bash

db_file="database.txt"
# code for main menu option
main_menu(){
	echo "================ menu options ==================="
	echo "Press i to add new contact."
	echo "Press v to view all contacts."
	echo "Press s to search for record."
	echo "Press e to delete all contacts."
	echo "Press d to delete one contact."
	echo "Press q to exit."
	echo "================================================="

}

menu_return(){
	echo "================================================="
	# read -p " press m to return to main meu or press q to exist:" option
	while true; do
		read -p " press m to return to main meu or press q to exist:" option
		case "$option" in
			m) return 0;;
			q) echo "Close system"; exit 0;;
			*) echo "you entered wrong option";;
		esac
	done
}

create_contact(){
	echo "Create new contact"
	read -p "please enter first name: " first_name
	read -p "please enter last name: " last_name
	read -p "please enter E-mail: " email
	read -p "please enter phone number: " phone
	echo "f_name: $first_name , l_name: $last_name ,  email: $email , phone: $phone" >> "$db_file"
	echo "*******Data inserted successfully*******"
	echo "If you want to see data please choose v from main menu or s to search it================="
}

view_all(){
	echo "showing all contacts in DB"
	if [ ! -s "$db_file" ]
	then
		echo "file is empty"
	else
		echo "start of contacts==================================="
		cat "$db_file"
		echo "End of Contacts====================================="
	fi
}

delete_all(){
	echo "Deleting all data of contacts"
	if [ ! -s "$db_file" ]
        then
                echo "file is empty"
        else
                : > "$db_file"
                echo "***** date removed successfully *****"
        fi

}

search_contact(){
	echo "start searching in data"
	read -p "please enter what u are looking for: " search_input
	result=$(grep "$search_input" "$db_file")
	if [ -n "$result" ]
	then
		echo "search result: $result"
	else
		echo "Not found"
	fi
}


delete_one_contact(){
        echo "start searching for contact to delete iit"
        read -p "please enter what u are looking for to delete id: " search_input
        result=$(grep "$search_input" "$db_file")
        if [ -n "$result" ]
        then
		sed -i "/$result/d" "$db_file"
                echo "line deleted successfully"
        else
                echo "Line Not found"
        fi
}








echo "Welcome To Contact DB System"
while true; do
	main_menu

	read -p "Please Choose one of the options shown above: " option
	case "$option" in
		i) create_contact; menu_return ;;
		v) view_all; menu_return ;;
		s) search_contact; menu_return ;;
		e) delete_all; menu_return ;;
		d) delete_one_contact; menu_return ;;
		q) echo "Bye!"; exit 0 ;;
		*) echo "you choose wrong option" ;;
	esac
done
