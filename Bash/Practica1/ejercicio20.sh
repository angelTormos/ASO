#!/bin/bash

read -p "Introduce un numero " num

if [[ "$num" -lt 2 ]]; then
    echo "$num no es primo"
fi

for ((i=2; i<=num/2; i++)); do
    if [[ num % i -eq 0 || num -eq 1 ]]; then
        echo "$num no es primo"
	break
    else
	echo "$num es primo"
    fi
done

