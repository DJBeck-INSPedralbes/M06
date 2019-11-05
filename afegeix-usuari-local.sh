#!/bin/bash

if [[ "${UID}" -eq 0 ]]
then
	read -p 'Enter the username to create: ' USER_NAME
	read -p 'Enter the name of the person who this account is for: ' COMMENT
	read -p 'Enter the password to use for the account: ' PASSWORD
	useradd -c "${COMMENT}" -m ${USER_NAME}
	echo ${PASSWORD} | passwd --stdin ${USER_NAME}
	passwd -e ${USER_NAME}
else
	echo 'You are not root'
	exit 1
fi

