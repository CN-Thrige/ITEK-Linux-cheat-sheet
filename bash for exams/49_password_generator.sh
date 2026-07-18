#!/bin/bash
# Password Generator
# Explanation: Asks for confirmation, then generates a random password
# of a specified length using characters from a set.

echo "Would you like to make a new password?"
read -p "Are you sure? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    length=12
    characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()"
    password=$(head /dev/urandom | tr -dc "$characters" | head -c "$length")
    echo "Generated Password: $password"
else
    echo "Password generation cancelled."
fi
