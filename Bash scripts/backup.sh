#!/bin/bash
source_dir="/home/doc"
backup_dir="/home/doc/bashdir/backup"
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"
tar -czvf "$backup_dir/$backup_file" "$source_dir"
