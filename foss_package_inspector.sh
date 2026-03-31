#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: ROHITH | Course: Open Source Software
# Purpose: Checks if a FOSS package is installed and prints its philosophy
 
PACKAGE="linux-image-$(uname -r)"   # The package to inspect
 
# --- Check installation using dpkg (Debian/Ubuntu) ---
if dpkg -l "$PACKAGE" &>/dev/null 2>&1; then
    echo "Package [$PACKAGE] is installed."
    echo "-------------------------------------------"
    dpkg -s "$PACKAGE" | grep -E 'Version|Status|Description'
else
    echo "Package [$PACKAGE] is NOT installed."
fi
 
echo "-------------------------------------------"
 
# --- Case statement: print a philosophy note per package type ---
BASE=$(echo "$PACKAGE" | cut -d- -f1)
case $BASE in
    linux)   echo "Linux: the open foundation everything else runs on -- GPL v2" ;;
    apache|httpd) echo "Apache: the web server that built the open internet -- Apache 2.0" ;;
    mysql)   echo "MySQL: open source at the heart of millions of apps -- GPL v2" ;;
    vlc)     echo "VLC: plays anything, built by students, shared freely -- LGPL" ;;
    firefox) echo "Firefox: a nonprofit fighting for an open web -- MPL 2.0" ;;
    git)     echo "Git: built by Linus when proprietary SCM failed him -- GPL v2" ;;
    python)  echo "Python: shaped entirely by its community -- PSF License" ;;
    *)       echo "An open-source tool -- built openly, shared freely." ;;
esac
