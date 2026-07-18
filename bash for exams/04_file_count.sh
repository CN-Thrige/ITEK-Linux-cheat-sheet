#!/bin/bash
# File Count
# Explanation: Counts the number of files in the current directory.

file_count=$(ls | wc -l)
echo "Number of files: $file_count"
