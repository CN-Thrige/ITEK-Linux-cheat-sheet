#!/bin/bash
BACKUP_DIR="/home/thrigedev2/backups"         # Destination directory for backups
SOURCE_DIR="/home/thrigedev2/bashscripts_for_exam"                 # Home directory (source of the file to copy)
DEST_DIR="/etc"                               # Destination directory

TIMESTAMP=$(date +'%Y%m%d%H%M%S')
BACKUP_FOLDER="$BACKUP_DIR/backup_$TIMESTAMP"

# Ask the user which file to copy
read -p "Enter the filename to copy from $SOURCE_DIR to $DEST_DIR: " FILE_NAME

# Check if the backup folder exists, create it if not
if [ ! -d "$BACKUP_FOLDER" ]; then
    mkdir -p "$BACKUP_FOLDER"
    echo "Created backup folder: $BACKUP_FOLDER"
fi

# Check if the chosen file actually exists before doing anything
if [ ! -f "$SOURCE_DIR/$FILE_NAME" ]; then
    echo "Error: $SOURCE_DIR/$FILE_NAME does not exist."
    exit 1
fi

# Copy the file to /etc
if cp "$SOURCE_DIR/$FILE_NAME" "$DEST_DIR/"; then
    echo "Copied $FILE_NAME to $DEST_DIR at $TIMESTAMP" >> "$BACKUP_DIR/backup_log.txt"
