#!/bin/bash

#creo los grupos
 echo "creo los grupos"
 	sudo groupadd p1c2_2024_gAlumno
	sudo groupadd p1c2_2024_gProfesores

#creo los usuarios
 echo "creo los usuarios"
 	sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep $(whoami) /etc/shadow |awk -F ':' '{print $2}')" p1c2_2024_A1
	echo "p1c2_2024_A1"

	sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep $(whoami) /etc/shadow |awk -F ':' '{print $2}')" p1c2_2024_A2
	echo "p1c2_2024_A2"

	sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep $(whoami) /etc/shadow |awk -F ':' '{print $2}')" p1c2_2024_A3
	echo "p1c2_2024_A3"

	sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -p "$(sudo grep $(whoami) /etc/shadow |awk -F ':' '{print $2}')" p1c2_2024_P1
	echo "p1c2_2024_P1"

#creo las carpetas
	sudo mkdir -p /Examenes-UTN/alumno_1
	echo "/Examenes-UTN/alumno_1"
	
	sudo mkdir -p /Examenes-UTN/alumno_2
	echo "/Examenes-UTN/alumno_2"

	sudo mkdir -p /Examenes-UTN/alumno_3
	echo "/Examenes-UTN/alumno_3"
	
	sudo mkdir -p /Examenes-UTN/profesores
	echo "/Examenes-UTN/profesores"

#les pongo el dueño y grupo
	sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
	sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
	sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
	sudo chown -R p1c2_2024_P1:p1c2_2024_P1 /Examenes-UTN/profesores

#-----P E R M I S O S------
 echo "permisos"

	sudo chmod -R 750 /Examenes-UTN/alumno_1
	# dueño: todo (7), grupo: leer y ejecutar (5), otros: nada (0)

	sudo chmod -R 760 /Examenes-UTN/alumno_2
	# dueño: todo ( rwx 7), grupo: leer y escribir ( rw- 6), otros: nada ( --- 0)

	sudo chmod -R 700 /Examenes-UTN/alumno_3
	# dueño: todo (7), grupo: nada (0), otros: nada (0)

	sudo chmod -R 775 /Examenes-UTN/profesores
	# dueño: todo (7), grupo: todo (7), otros: lectura y escritura (5)

#Crear un archivo “validar.txt” con la salida del comando whoami, con cada uno de los 
#usuarios en sus respectivas carpetas.
	sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1

	sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
	
	sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3

	sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1

#muestro resultado de validacion
	
	echo "alu1"
	cat /Examenes-UTN/alumno_1
        ls -ld /Examenes-UTN/alumno_1
        ls -l /Examenes-UTN/alumno_1

	echo "alu2"
        cat /Examenes-UTN/alumno_2
        ls -ld /Examenes-UTN/alumno_2
        ls -l /Examenes-UTN/alumno_2

	echo "alu3"
        cat /Examenes-UTN/alumno_3
        ls -ld /Examenes-UTN/alumno_3
        ls -l /Examenes-UTN/alumno_3
	
	echo "profe"
	cat /Examenes-UTN/profesores/
	ls -ld /Examenes-UTN/profesores/
	ls -l /Examenes-UTN/profesores/


