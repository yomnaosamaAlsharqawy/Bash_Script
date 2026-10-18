#! /usr/bin/bash

# Use -n to check if the string length is non-zero
#  use -z to check if the parameter is empty (length is zero)
global_passwd="Linux@123"

set_passwd() {
    local user_name="$1"
		echo "-----------------------------------------------------------------------------$user_name"
    USERNAME="$user_name" PASSWORD="$global_passwd" expect <<'EOF'
set timeout 20
set username $env(USERNAME)
set password $env(PASSWORD)
spawn passwd $username
expect {
    -re "(?i)new password:|password:" {
        send "$password\r"
    }
    timeout { puts "ERROR: no password prompt"; exit 1 }
    eof     { puts "ERROR: passwd exited early"; exit 1 }
}
expect {
    -re "(?i)re-enter new password:|retype new password:" {
        send "$password\r"
    }
    timeout { puts "ERROR: no confirmation prompt"; exit 1 }
    eof     { puts "ERROR: passwd exited early"; exit 1 }
}
expect eof
catch wait result
exit [lindex $result 3]
EOF
}


create_user(){
	local user_name="$1"
	if [ -z "$user_name" ]
	then 
		echo "please make user to enter user name"
	else
		if id "$user_name" &>/dev/null
		then 
			echo "user already exist"
			return 0
		else
			sudo useradd -m -s /bin/bash "$user_name"
			echo "user created successfully"
			if set_passwd "$user_name"
			then
				 echo "Password set for: $user_name"
				if ! sudo -u "$user_name" bash -c "exit 0"; then
					 echo "Error: Failed to login or execute shell as user."
				else
					echo "login by user $user_name was success"
				fi
			else
        			echo "Failed to set password for: $user_name" >&2
        			return 1
    			fi

		fi
	fi
}
users_list=("ahmed" "mohamed" "ali" "sara" "nour" "sam")
if [ ${#users_list[@]} -eq 0 ];
then
	echo "please enter list of users first"
fi
for user in "${users_list[@]}"; do
	echo "welcome user: $user"
	create_user "$user"

done
# create_user test
