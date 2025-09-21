#!/bin/bash

origen="$1"
destino="$2"

if [ ! -f $"origen" ]; then
	echo "Error: el fichero no existe"
fi

if [ -e "$destino"]; then
	echo "Error: ya hay un fichero con ese nombre"
fi

cp "$origen" "$destino"
echo "Copia realizada"
