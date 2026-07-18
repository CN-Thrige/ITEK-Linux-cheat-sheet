#!/bin/bash
# Cleanup Logs Confirm
# Explanation: Finds log files older than a set number of days, shows
# them to the user, and only deletes them after confirmation.

LOG_DIR="/var/log/bashscripts_for_exam"   # directory containing logs
DAYS_OLD=7                                # delete logs older than this many days

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: $LOG_DIR does not exist."
    exit 1
fi

echo "Log files older than $DAYS_OLD days in $LOG_DIR:"
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS_OLD"

read -p "Delete these files? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS_OLD" -delete
    echo "Old log files deleted."
else
    echo "Cleanup cancelled."
fi
