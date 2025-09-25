#!/bin/bash

numero_secreto=42   # número fijo a adivinar
intento=-1

echo "🎲 Adivina el número (1-100). Introduce 0 para rendirte."

while [ $intento -ne $numero_secreto ]; do
    read -p "Introduce un número: " intento

    if [ $intento -eq 0 ]; then
        echo "Te has rendido. El número era $numero_secreto."
        exit 0
    elif [ $intento -lt $numero_secreto ]; then
        echo "El número es MAYOR."
    elif [ $intento -gt $numero_secreto ]; then
        echo "El número es MENOR."
    else
        echo "🎉 Enhorabuena, has adivinado el número!"
    fi
done