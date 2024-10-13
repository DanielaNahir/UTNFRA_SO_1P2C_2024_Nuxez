#!/bin/bash

# creo la carpeta (en el home)

echo "creo la carpeta"
mkdir -p Estructura_Asimetrica/{{correo,cliente}/cartas_{1..100},correo/carteros{1..10}}

echo "tree de la carpeta:"

tree Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

