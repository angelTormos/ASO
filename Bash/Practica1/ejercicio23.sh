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

contador=0
for entry in "$dir"/*; do
    if [ -h "$entry" ]; then
        tipo="Enlace simbólico"
    elif [ -b "$entry" ]; then
        tipo="Archivo especial de bloque"
    elif [ -c "$entry" ]; then
        tipo="Archivo especial de carácter"
    elif [ -d "$entry" ]; then
        tipo="Directorio"
    elif [ -f "$entry" ]; then
        tipo="Fichero"
    else
        tipo="Otro"
    fi
    echo "$(basename "$entry") → $tipo"
    contador=$((contador + 1))
done

echo "Total de entradas: $contador"
