#!/bin/bash
# File Decryption
# Explanation: Decrypts an encrypted file.

encrypted_file="file.txt.gpg"
gpg -d "$encrypted_file" > "decrypted_file.txt"
