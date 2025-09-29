#!/bin/bash

dir="${1:-.}"

if [ ! -d "$dir" ]; then
    echo "Uso: $0 [directorio]"
    echo "'$dir' no es un directorio válido."
    exit 1
fi

salida="archivos_peligrosos.txt"

{
    echo "Informe generado: $(date --iso-8601=seconds)"
    echo "Directorio buscado: $(realpath "$dir")"
    echo
    echo "Ficheros regulares world-writable (permiso 'otros' escribe):"
    echo "----------------------------------------------------------"
    find "$dir" -type f -perm -o=w -print
    echo

    echo "Total: $(find "$dir" -type f -perm -o=w -print | wc -l) ficheros"
} > "$salida"

echo "Listado guardado en: $salida"
