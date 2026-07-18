#!/bin/bash
# String Manipulation
# Explanation: Converts a string to uppercase.

string="Hello, World!"
uppercase_string=$(echo "$string" | tr '[:lower:]' '[:upper:]')
echo "$uppercase_string"
