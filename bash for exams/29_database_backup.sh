#!/bin/bash
# Database Backup
# Explanation: Creates a MySQL database backup.

db_name="mydb"
backup_file="backup.sql"
mysqldump -u username -p$password "$db_name" > "$backup_file"
