#!/bin/bash
#comprobación usuario es root
if [[ "${UID}" -eq 0 ]]
then
    #introducir nombre de usuario
	read -p 'Introduce el nombre del nuevo usuario ' USER_NAME
    #introducir el nombre de la persona
	read -p 'Introduce el nombre del usuario que va a utilizar esta cuenta ' NAME
    #introducir la password del usuario
	read -p 'Introduce la contraseña: ' PASSWORD
    #ejecuccion del comando para introducir el nuevo usuario
	useradd -c "${NAME}" -m ${USER_NAME}
    #cambia la contraseña del usuario
	echo ${USER_NAME}":"${PASSWORD} | chpasswd 
    #obliga al usuario a cambiar la contraseña en el primer login
	passwd -e ${USER_NAME}
else
	echo 'No tienes privilegios de root'
	exit 1
fi
