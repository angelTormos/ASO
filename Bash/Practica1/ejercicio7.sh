#! /bin/bash

read -p "Introduce un directorio: " directorio

if [ ! -d $1 ]; then
    echo "Error: el directorio '$1' no existe."
    exit 1
fi

FECHA=$(date +%F)

ARCHIVO="${FECHA}_$1.tar.gz"

tar -czf "$ARCHIVO" -C "$(dirname "$1")" "$(basename "$1")"

echo "Archivo creado: $ARCHIVO"

