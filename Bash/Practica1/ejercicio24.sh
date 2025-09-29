#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

dir=$1

if [ ! -d "$dir" ]; then
    echo "$dir no es un directorio válido."
    exit 1
fi

ficheros=$(find "$dir" -maxdepth 1 -type f | wc -l)
directorios=$(find "$dir" -maxdepth 1 -type d | wc -l)

directorios=$((directorios - 1))

echo "Estadísticas de $dir"
echo "Ficheros: $ficheros"
echo "Subdirectorios: $directorios"

