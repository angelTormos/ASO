#!/bin/bash
suma=0

while true; do
    read -p "Introduce un número (0 para terminar): " numero
    if [ "$numero" -eq 0 ]; then
        break
    fi
    suma=$((suma + numero))
    echo "Suma actual: $suma"
done

echo "Resultado final: $suma"
