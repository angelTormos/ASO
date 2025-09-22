#!/bin/bash

read -p "Introduce un numero: " n

for i in {1..10}; do
	resultado=$((n*i))
	echo " $n * $i = $resultado"
done
