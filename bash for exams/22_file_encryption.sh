#!/bin/bash
# File Encryption
# Explanation: Encrypts a file using GPG.

file_to_encrypt="file.txt"
gpg -c "$file_to_encrypt"
