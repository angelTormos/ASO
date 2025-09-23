#!/bin/bash

archivo="lista.txt"

echo "1 Añadir, 2 Buscar, 3 Listar, 4 Ordenar, 5 Borrar, 6 Salir"
read -p "Elige una opción: " opcion

    if [ "$opcion" -eq 1 ]; then
        read -p "Nombre: " nombre
        read -p "Dirección: " direccion
        read -p "Teléfono: " telefono
        echo "$nombre | $direccion | $telefono" >> "$archivo"

    elif [ "$opcion" -eq 2 ]; then
        read -p "Introduce término de búsqueda: " busqueda
        if grep -i "$busqueda" "$archivo" 2>/dev/null; then
            :
        else
            echo "No encontrado."
        fi

    elif [ "$opcion" -eq 3 ]; then
        if [ -f "$archivo" ]; then
            cat "$archivo"
        else
            echo "La agenda está vacía."
        fi

    elif [ "$opcion" -eq 4 ]; then
        if [ -f "$archivo" ]; then
            sort "$archivo" -o "$archivo"
            echo "Agenda ordenada."
        else
            echo "La agenda está vacía."
        fi

    elif [ "$opcion" -eq 5 ]; then
        rm -f "$archivo"
        echo "Archivo eliminado."

    elif [ "$opcion" -eq 6 ]; then
        echo "Saliendo..."
        exit 0

    else
        echo "Opción inválida."
    fi
