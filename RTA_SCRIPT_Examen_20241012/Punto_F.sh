#!/bin/bash



 echo "agrego el ip"

 	echo "Mi IP publica: $(curl -s ifconfig.me)" >> RTA_ARCHIVOS_Examen_20241012/Filtro_Avanzado.txt
 
 echo "agrego el usuario"

 	echo "Mi usuario es: $(sudo grep $(whoami) /etc/shadow |awk -F ':' '{print $1}')" >> RTA_ARCHIVOS_Examen_20241012/Filtro_Avanzado.txt

 echo "agrego el hash"
	
	echo "El Hash de mi usuario es: $(sudo grep $(whoami) /etc/shadow |awk -F ':' '{print $2}')" >> RTA_ARCHIVOS_Examen_20241012/Filtro_Avanzado.txt
 
 echo "agrego url del repo"

 	echo "La URL de mi repositorio es: $(git remote get-url origin )" >> RTA_ARCHIVOS_Examen_20241012/Filtro_Avanzado.txt
