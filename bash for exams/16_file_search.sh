#!/bin/bash
# File Search
# Explanation: Searches for a specified pattern recursively in files.

search_dir="/path/to/search"
search_term="pattern"
grep -r "$search_term" "$search_dir"
