#!/bin/bash
# File Decompression
# Explanation: Decompresses a file compressed with tar and gzip.

compressed_file="compressed_file.tar.gz"
tar -xzvf "$compressed_file"
