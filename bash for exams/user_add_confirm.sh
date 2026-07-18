#!/bin/bash
# User Add Confirm
# Explanation: Asks for a username, checks it doesn't already exist,
# confirms before creating the account, then logs the action.

LOG_FILE="/home/thrigedev2/backups/useradd_log.txt"

read -p "Enter the username to create: " USERNAME

if id "$USERNAME" &>/dev/null; then
    echo "Error: user $USERNAME already exists."
    exit 1
fi

echo "About to create user: $USERNAME"
read -p "Are you sure? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo useradd -m "$USERNAME"
    TIMESTAMP=$(date +'%Y%m%d%H%M%S')
    echo "Created user $USERNAME at $TIMESTAMP" >> "$LOG_FILE"
    echo "User $USERNAME created. Set a password with: sudo passwd $USERNAME"
else
    echo "User creation cancelled."
fi
