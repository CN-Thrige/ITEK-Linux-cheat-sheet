#!/bin/bash
# URL Validation
# Explanation: Validates user input as a URL.

read -p "Enter a URL: " url
if [[ $url =~ ^(http|https)://[A-Za-z0-9.-/]+$ ]]; then
    echo "Valid URL: $url"
else
    echo "Invalid URL."
fi
