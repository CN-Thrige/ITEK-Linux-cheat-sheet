#!/bin/bash
# Confirm Backup
# Explanation: Asks for confirmation, then creates a timestamped tar.gz
# backup of a source directory, similar in style to backup_and_move.sh
# and updater.sh (read -p confirmation before doing anything).

SOURCE_DIR="/home/thrigedev2/bashscripts_for_exam"   # directory to back up
BACKUP_DIR="/home/thrigedev2/backups"                # where backups are stored

# Check the source directory actually exists first
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: $SOURCE_DIR does not exist."
    exit 1
fi

echo "This will back up $SOURCE_DIR to $BACKUP_DIR"
read -p "Are you sure? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    TIMESTAMP=$(date +'%Y%m%d%H%M%S')
    BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

    # Make sure the backup directory exists
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "Created backup folder: $BACKUP_DIR"
    fi

    tar -czvf "$BACKUP_FILE" "$SOURCE_DIR"
    echo "Backed up $SOURCE_DIR to $BACKUP_FILE at $TIMESTAMP" >> "$BACKUP_DIR/backup_log.txt"
    echo "Backup complete: $BACKUP_FILE"
else
    echo "Backup cancelled."
fi
