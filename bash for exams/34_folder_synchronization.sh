#!/bin/bash
# Folder Synchronization
# Explanation: Synchronizes the contents of two directories using rsync.

source_dir="/path/to/source"
destination_dir="/path/to/destination"
rsync -av "$source_dir/" "$destination_dir/"
