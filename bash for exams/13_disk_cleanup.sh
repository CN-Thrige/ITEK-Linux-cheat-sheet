#!/bin/bash
# Disk Cleanup
# Explanation: Displays disk usage of log files and then deletes them

du -sh /var/log/*
rm -rf /var/log/*
