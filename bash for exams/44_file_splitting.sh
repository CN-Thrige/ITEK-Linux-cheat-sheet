#!/bin/bash
# File Splitting
# Explanation: Joins split files to reconstruct the original file.

input_file="large_file.txt"
split -b 1M "$input_file" "split_file"
