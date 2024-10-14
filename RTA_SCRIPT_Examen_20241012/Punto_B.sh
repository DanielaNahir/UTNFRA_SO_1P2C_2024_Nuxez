#!/bin/bash

echo "disco 10GB"
	
#busco disco y lo pongo en una variable

	DISCO=$(sudo fdisk -l |grep Disk |grep "10 GiB" | awk '{print $2}' |sed 's/://g')

#particiono el disco

#una particion extendida de los 10g y 10 particiones logicas

sudo fdisk $DISCO << EOF
n
e
4


n

+1023M
n

+1023M
n

+1023M
n

+1023M
n

+1023M
n

+1023M
n

+1023M
n

+1023M
n

+1023M
n


w
EOF


#formateo las particiones
	echo "formateo las particiones con ext4"
	for n in /dev/sdc{5..14}; do sudo mkfs.ext4 $n; done
	
#creo las carpetas por si acaso (?? no dice que lo haga pero porsi)
	mkdir -p /Examenes-UTN/{alumno_{1..3}/parcial_{1..3},profesores}

#Montar de forma Persistente
	
	# seguramente existe una forma mas eficiente de hacerlo con for

	echo "montaje persistente"
	echo "/dev/sdc5  /Examenes-UTN/alumno_1/parcial_1   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc6  /Examenes-UTN/alumno_1/parcial_2   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc7  /Examenes-UTN/alumno_1/parcial_3   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc8  /Examenes-UTN/alumno_2/parcial_1   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc9  /Examenes-UTN/alumno_2/parcial_2   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc10  /Examenes-UTN/alumno_2/parcial_3   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc11  /Examenes-UTN/alumno_3/parcial_1   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc12  /Examenes-UTN/alumno_3/parcial_2   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc13  /Examenes-UTN/alumno_3/parcial_3   ext4     defaults 0 0" | sudo tee -a /etc/fstab
	echo "/dev/sdc14  /Examenes-UTN/profesores   ext4     defaults 0 0" | sudo tee -a /etc/fstab

#verifico
	
	cat /etc/fstab | grep sdc5
	echo "ejecuto sudo systemctl daemon-reload"
	sudo systemctl daemon-reload
	sudo mount -a
	echo "veo las particiones"
	cat /etc/fstab | grep sdc5
