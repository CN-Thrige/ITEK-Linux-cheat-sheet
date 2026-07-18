#!/bin/bash
# System Backup Script
# Explanation: Creates a timestamped backup of a directory, similar to the intermediate script but without user prompts.

source_dir="/path/to/source"
backup_dir="/path/to/backup"
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"
tar -czvf "$backup_dir/$backup_file" "$source_dir"
