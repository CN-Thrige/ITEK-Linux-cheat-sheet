#!/bin/bash
# Copy With Confirmation
# Explanation: Asks the user which file to copy, confirms before doing
# anything dangerous, then copies it and logs the action.

SOURCE_DIR="/home/thrigedev2/bashscripts_for_exam"   # source of the file
DEST_DIR="/etc"                                      # destination directory
LOG_FILE="/home/thrigedev2/backups/copy_log.txt"      # log of copy actions

read -p "Enter the filename to copy from $SOURCE_DIR to $DEST_DIR: " FILE_NAME

# Check the file actually exists before doing anything
if [ ! -f "$SOURCE_DIR/$FILE_NAME" ]; then
    echo "Error: $SOURCE_DIR/$FILE_NAME does not exist."
    exit 1
fi

echo "About to copy $FILE_NAME to $DEST_DIR"
read -p "Are you sure? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    TIMESTAMP=$(date +'%Y%m%d%H%M%S')

    if cp "$SOURCE_DIR/$FILE_NAME" "$DEST_DIR/"; then
        echo "Copied $FILE_NAME to $DEST_DIR at $TIMESTAMP" >> "$LOG_FILE"
        echo "Copy successful."
    else
        echo "Copy failed."
        exit 1
    fi
else
    echo "Copy cancelled."
fi
