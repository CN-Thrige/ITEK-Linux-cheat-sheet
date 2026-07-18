#!/bin/bash
# File Watcher
# Explanation: Watches a directory for file changes using inotifywait.

directory="/path/to/watch"
inotifywait -m -r -e create,modify,delete "$directory" |
while read path action file; do
    echo "File $file was $action."
done
