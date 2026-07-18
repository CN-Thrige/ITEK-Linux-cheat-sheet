#!/bin/bash
# Send Email Alert
# Explanation: Sends an email alert.

email="user@example.com"
subject="Alert"
message="Disk space is running low!"
echo "$message" | mail -s "$subject" "$email"
