#!/bin/bash
# CSV File Processing
# Explanation: Extracts specific columns from a CSV file and saves them to a new file.

input_csv="data.csv"
output_file="output.txt"
awk -F ',' '{print $1,$2}' "$input_csv" > "$output_file"
