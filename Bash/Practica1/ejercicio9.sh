# /bin/bash

echo "1-Suma 2-Resta 3-Multiplicacion 4-Division"
read -p "Introduce una opcion " opcion
read -p "Introduce el primer numero " num1
read -p "Introduce el segundo numero " num2



case $opcion in
	"1")
		resultado=$(($num1+$num2))
		echo $resultado
	;;
	"2")
                resultado=$(($num1-$num2))
                echo $resultado
        ;;
	"3")
                resultado=$(($num1*$num2))
                echo $resultado
        ;;
	"4")
                resultado=$(($num1/$num2))
                echo $resultado
        ;;
esac
