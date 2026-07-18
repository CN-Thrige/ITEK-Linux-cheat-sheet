#!/bin/bash
# Input Validation
# Explanation: Validates user input to ensure it is a number.

read -p "Enter a number: " number
if [[ ! "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a number."
else
    echo "You entered: $number"
fi
