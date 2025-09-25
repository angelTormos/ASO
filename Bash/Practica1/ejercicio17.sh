#!/bin/bash

suma = 0

while True:
    numero = int(input("Introduce un número (0 para terminar): "))
    if numero == 0:
        break
    suma += numero
    print(f"Suma actual: {suma}")

print(f"Resultado final: {suma}")