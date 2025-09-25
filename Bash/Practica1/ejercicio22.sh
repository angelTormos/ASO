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
    if [ -f "$entry" ]; then
        echo "$(basename "$entry") → Fichero"
    elif [ -d "$entry" ]; then
        echo "$(basename "$entry") → Directorio"
    fi
    contador=$((contador + 1))
done

echo "Total de entradas: $contador"