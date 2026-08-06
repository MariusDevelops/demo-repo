#!/bin/bash

echo "=== Health Check ==="

DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "Disk usage: $DISK"

echo "Memory:"
free -h