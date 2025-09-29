#!/bin/bash

existe() {
    fichero=$1
    if [ -f "$fichero" ]; then
        echo "El fichero '$fichero' existe."
        chmod u+x "$fichero"
        echo "Se ha dado permiso de ejecución al propietario (u+x)."
    else
        echo "El fichero '$fichero' no existe."
        exit 1
    fi
}

if [ $# -ne 1 ]; then
    echo "Uso: $0 <fichero>"
    exit 1
fi

existe "$1"
