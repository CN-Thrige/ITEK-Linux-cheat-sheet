#!/bin/bash
# File Backup
# Explanation: Creates a timestamped backup of a directory using tar compression.

source_dir="/path/to/source"
backup_dir="/path/to/backup"
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"
tar -czvf "$backup_dir/$backup_file" "$source_dir"
