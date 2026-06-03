#!/bin/bash
echo disk usage
df -h

echo System Info
uname -a

echo user info 
username=$(whoami)
echo "Current user: $username"

echo Process List
ps aux

