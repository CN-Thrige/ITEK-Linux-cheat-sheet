#!/bin/bash
# File Permissions Report
# Explanation: Creates a report of file permissions for all files in a directory

find /path/to/files -type f -exec ls -l {} \; > permissions_report.txt
