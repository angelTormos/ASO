#!/bin/bash


if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    echo "Error. La sintaxis correcta es: nombre apellido1 apellido2 [grupo]"
fi

accion=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5

id_usuario="alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}"
id_usuario=$(echo "$id_usuario" | tr '[:upper:]' '[:lower:]')

if [ "$accion" = "alta" ]; then
    if [ -z "$grupo" ]; then
        grupo=$id_usuario
        groupadd "$grupo"
    fi
    useradd -m -g "$grupo" "$id_usuario"
    echo "Usuario $id_usuario creado en el grupo $grupo."
elif [ "$accion" = "baja" ]; then
    userdel -r "$id_usuario" 2>/dev/null
    echo "Usuario $id_usuario eliminado."
else
    echo "Error. La sintaxis correcta es:  nombre apellido1 apellido2 [grupo]"

fi
