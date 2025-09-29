#!/bin/bash

read -p "Introduce un número: " num

if [[ $num -lt 2 ]]; then
    echo "$num no es primo"
    exit 0
fi

es_primo=1

for ((i=2; i<=num/2; i++)); do
    if (( num % i == 0 )); then
        es_primo=0
        break
    fi
done

if [[ $es_primo -eq 1 ]]; then
    echo "$num es primo"
else
    echo "$num no es primo"
fi
