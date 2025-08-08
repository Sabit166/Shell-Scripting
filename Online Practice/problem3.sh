#!/bin/bash

factorial() {
    local num=$1
    local fact=1
    for ((i=1; i<=num; i++)); do
        fact=$((fact * i))
    done
    echo $fact
}

nPr() {
    local n=$1
    local r=$2
    echo $(( $(factorial $n) / $(factorial $((n - r))) ))
}

nCr() {
    local n=$1
    local r=$2
    echo $(( $(factorial $n) / ($(factorial $r) * $(factorial $((n - r)))) ))
}

read -p "Enter a number to calculate factorial: " num
echo "Factorial of $num is: $(factorial $num)"

read -p "Enter n for nPr and nCr: " n
read -p "Enter r for nPr and nCr: " r
echo "nPr($n,$r) = $(nPr $n $r)"
echo "nCr($n,$r) = $(nCr $n $r)"