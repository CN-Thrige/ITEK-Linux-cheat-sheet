#!/bin/bash
# Cron Job Example
# Explanation: A script that can be scheduled as a cron job to automate backups at regular intervals.

backup_dir="/path/to/backup"
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"
tar -czvf "$backup_dir/$backup_file" /path/to/source
