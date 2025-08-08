#!/bin/bash

add() {
    echo $(($1 + $2))
}

subtract() {
    echo $(($1 - $2))
}

multiply() {
    echo $(($1 * $2))
}

divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: Division by zero"
    else
        echo $(($1 / $2))
    fi
}

while true; do
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Exit"
    read -p "Choose an operation (1-5): " choice
    
    if [ $choice -eq 5 ]; then
        break
    fi
    
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2
    
    case $choice in
        1) echo "Result: $(add $num1 $num2)" ;;
        2) echo "Result: $(subtract $num1 $num2)" ;;
        3) echo "Result: $(multiply $num1 $num2)" ;;
        4) echo "Result: $(divide $num1 $num2)" ;;
        *) echo "Invalid choice" ;;
    esac
done