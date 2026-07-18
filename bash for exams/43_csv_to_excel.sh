#!/bin/bash
# CSV to Excel
# Explanation: Converts a CSV file to an Excel (XLSX) file using Gnumeric's ss convert.

input_csv="data.csv"
output_xlsx="data.xlsx"
ssconvert "$input_csv" "$output_xlsx"
