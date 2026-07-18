#!/bin/bash
# User Management
# Explanation: Creates a new user and sets their password.

username="newuser"
password="password123"
useradd "$username"
echo "$username:$password" | chpasswd
