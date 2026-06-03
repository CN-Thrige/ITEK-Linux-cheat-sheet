#!/bin/bash
source_dir= /home/thrigedev2/doc
backup_dir= /home/thrigedev2/doc/bashdir
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"
tar -czvf "$backup_dir/$backup_file" "$source_dir"
