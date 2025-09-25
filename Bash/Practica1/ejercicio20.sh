#!/bin/bash

num=$1

if [ "$num" -lt 2 ]; then
    echo "$num NO es primo"
    exit 0
fi

for ((i=2; i<=num/2; i++)); do
    if (( num % i == 0 )); then
        echo "$num NO es primo"
        exit 0
    fi
done

echo "$num ES primo"