#!/bin/bash
# URL Download
# Explanation: Downloads a file from a URL using wget.

url="https://example.com/file.txt"
output_file="downloaded_file.txt"
wget "$url" -O "$output_file"
