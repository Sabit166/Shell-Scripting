#!/bin/bash

is_prime() {
    local num=$1
    if [ $num -lt 2 ]; then
        return 1
    fi
    for ((i=2; i*i<=num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

read -p "Enter the larger number: " num1
read -p "Enter the smaller number: " num2

factors=()
for ((i=num2; i<=num1; i++)); do
    if [ $((num1 % i)) -eq 0 ] && is_prime $i; then
        factors+=($i)
    fi
done

echo "Prime factors of $num1 between $num2 and $num1: ${factors[@]}"