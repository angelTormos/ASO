#!/bin/bash

obtener_red() {
    interfaz=$(ip route | grep '^default' | awk '{print $5}')
    datos=$(ip -o -f inet addr show "$interfaz" | awk '{print $4}')
    ip_local=$(echo "$datos" | cut -d/ -f1)
    cidr=$(echo "$datos" | cut -d/ -f2)

    red=$(ipcalc -n "$ip_local/$cidr" | grep Network | awk '{print $2}')
    broadcast=$(ipcalc -b "$ip_local/$cidr" | grep Broadcast | awk '{print $2}')
    mascara=$(ipcalc -m "$ip_local/$cidr" | grep Netmask | awk '{print $2}')

    echo "Interfaz: $interfaz"
    echo "IP local: $ip_local"
    echo "Red: $red"
    echo "Broadcast: $broadcast"
    echo "Máscara: $mascara"
    echo "Rango CIDR: $ip_local/$cidr"
    echo
}

escanear_red() {
    red_cidr=$1
    echo "Escaneando red $red_cidr..."
    echo
    for ip in $(nmap -n -sL "$red_cidr" | awk '/Nmap scan report/{print $5}'); do
        if ping -c 1 -W 1 "$ip" &> /dev/null; then
            echo "$ip → OCUPADA"
        else
            echo "$ip → LIBRE"
        fi
    done
}

informe="informe_red.txt"
{
    echo "Informe de la red generado el: $(date)"
    echo "-------------------------------------------"
    obtener_red
    echo "Listado de IPs:"
    escanear_red "$(ip route | grep '^default' | awk '{print $3}' | cut -d. -f1-3).0/24"
} > "$informe"

echo "Informe guardado en $informe"
