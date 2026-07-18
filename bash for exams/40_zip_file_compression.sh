#!/bin/bash
# Zip File Compression
# Explanation: Compresses a file using ZIP compression.

file_to_compress="file.txt"
zip "compressed_file.zip" "$file_to_compress"
