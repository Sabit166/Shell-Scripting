#!/bin/bash

echo "Choose your favorite fruit from the following options:"
echo "1. Apple"
echo "2. Banana"
echo "3. Mango"
echo "4. Orange"
echo "5. Strawberry"
read -p "Enter your choice (1-5): " choice

case $choice in
    1) echo "An apple a day keeps the doctor away!" ;;
    2) echo "Bananas are great for quick energy!" ;;
    3) echo "Mangoes are the king of fruits!" ;;
    4) echo "Oranges are packed with vitamin C!" ;;
    5) echo "Strawberries are sweet and delicious!" ;;
    *) echo "Invalid choice. Please select between 1-5." ;;
esac