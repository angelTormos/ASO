#!/bin/bash

resultado=2

for i in {1..1000}; do
	resultado2=$((resultado2+resultado))
	echo $resultado2
done
