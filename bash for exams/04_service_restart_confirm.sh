#!/bin/bash
# Service Restart Confirm
# Explanation: Checks whether a service is running, then asks for
# confirmation before restarting it. Same read -p + regex confirmation
# pattern as updater.sh, applied to systemctl instead of apt.

SERVICE_NAME="nginx"   # change this to whatever service you need

if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "$SERVICE_NAME is currently running."
else
    echo "$SERVICE_NAME is not currently running."
fi

echo "Would you like to restart $SERVICE_NAME?"
read -p "Are you sure? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo systemctl restart "$SERVICE_NAME"

    if systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "$SERVICE_NAME restarted successfully."
    else
        echo "$SERVICE_NAME failed to start."
        exit 1
    fi
else
    echo "Restart cancelled."
fi
