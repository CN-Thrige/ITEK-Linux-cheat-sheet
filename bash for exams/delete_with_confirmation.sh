#!/bin/bash
# Delete With Confirmation
# Explanation: Asks which file to delete, confirms twice since deletion
# is dangerous and irreversible, then removes it and logs the action.

TARGET_DIR="/home/thrigedev2/bashscripts_for_exam"    # directory to delete from
LOG_FILE="/home/thrigedev2/backups/delete_log.txt"    # log of deletions

read -p "Enter the filename to delete from $TARGET_DIR: " FILE_NAME

if [ ! -f "$TARGET_DIR/$FILE_NAME" ]; then
    echo "Error: $TARGET_DIR/$FILE_NAME does not exist."
    exit 1
fi

echo "Would you like to permanently delete $FILE_NAME?"
read -p "Are you sure? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "This cannot be undone."
    read -p "Really sure? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        TIMESTAMP=$(date +'%Y%m%d%H%M%S')
        rm "$TARGET_DIR/$FILE_NAME"
        echo "Deleted $FILE_NAME at $TIMESTAMP" >> "$LOG_FILE"
        echo "File deleted."
    else
        echo "Deletion cancelled."
    fi
else
    echo "Deletion cancelled."
fi
