#!/bin/bash

read -p "Enter number of terms (N): " n

for ((i=0; i<n; i++)); do
    if [ $((i % 2)) -eq 0 ]; then
        echo -n "$((i**3)) "
    else
        echo -n "$((i**2)) "
    fi
done
echo