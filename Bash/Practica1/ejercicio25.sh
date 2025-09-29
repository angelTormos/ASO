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

ficheros=$(find "$dir" -maxdepth 1 -type f ! -name ".*" | wc -l)
directorios=$(find "$dir" -maxdepth 1 -type d ! -name ".*" | wc -l)
enlaces=$(find "$dir" -maxdepth 1 -type l | wc -l)
ocultos=$(find "$dir" -maxdepth 1 -name ".*" ! -name "." ! -name ".." | wc -l)

directorios=$((directorios - 1))

tamano=$(du -sh "$dir" | cut -f1)

echo "Informe del directorio: $dir"
echo "──────────────────────────────"
echo "Ficheros: $ficheros"
echo "Subdirectorios: $directorios"
echo "Enlaces: $enlaces"
echo "Ocultos: $ocultos"
echo "Tamaño total: $tamano"
