#!/bin/bash

 echo "creo y agrego a Filtro_Basico.txt la info de la memoria total"

	grep -i memtotal /proc/meminfo >> RTA_ARCHIVOS_Examen_20241012/Filtro_Basico.txt
 
 echo "agrego la info del fabricante de chassis"
 	
 	sudo dmidecode -t chassis | grep -i -E 'chassis information|manufac' >> RTA_ARCHIVOS_Examen_20241012/Filtro_Basico.txt
