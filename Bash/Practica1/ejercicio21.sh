#!/bin/bash

numero_secreto=42
intento=-1

echo "Adivina el número del 1 al 100. Introduce 0 para rendirte."

while [ $intento -ne $numero_secreto ]; do
    read -p "Introduce un número: " intento

    if [ $intento -eq 0 ]; then
        echo "El número era $numero_secreto."
        exit 0
    elif [ $intento -lt $numero_secreto ]; then
        echo "El número es mayor."
    elif [ $intento -gt $numero_secreto ]; then
        echo "El número es menor."
    else
        echo "Has adivinado el número"
    fi

done
