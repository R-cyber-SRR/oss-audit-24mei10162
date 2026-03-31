#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: ROHITH | Course: Open Source Software
# Purpose: Reports permissions and disk usage for key system directories
 
# --- Array of directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/lib/modules")
 
echo "================================================"
echo "   Directory Audit Report"
echo "================================================"
 
# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "  Dir   : $DIR"
        echo "  Perms : $PERMS  Owner: $OWNER  Group: $GROUP"
        echo "  Size  : $SIZE"
        echo "  ----------------------------------------"
    else
        echo "  [SKIP] $DIR does not exist on this system"
    fi
done
 
# --- Check kernel module directory ---
KMOD_DIR="/lib/modules/$(uname -r)"
echo ""
echo "Kernel Module Directory Check:"
if [ -d "$KMOD_DIR" ]; then
    KPERMS=$(ls -ld "$KMOD_DIR" | awk '{print $1, $3, $4}')
    echo "  Found : $KMOD_DIR"
    echo "  Perms : $KPERMS"
else
    echo "  Kernel module directory not found."
fi
