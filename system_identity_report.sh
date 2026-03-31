#!/bin/bash
# Script 1: System Identity Report
# Author: ROHITH | Course: Open Source Software
# Purpose: Displays a welcome screen with system info and OS license
 
# --- Student variables ---
STUDENT_NAME="ROHITH"
SOFTWARE_CHOICE="Linux Kernel"
 
# --- Gather system info using command substitution ---
KERNEL=$(uname -r)                        # Running kernel version
USER_NAME=$(whoami)                       # Currently logged-in user
UPTIME=$(uptime -p)                       # Human-readable uptime
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
DATETIME=$(date "+%A, %d %B %Y %H:%M:%S")
LICENSE="GNU General Public License version 2 (GPL v2)"
 
# --- Display the report ---
echo "================================================"
echo "   Open Source Audit -- $STUDENT_NAME"
echo "   Chosen Software  : $SOFTWARE_CHOICE"
echo "================================================"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATETIME"
echo "------------------------------------------------"
echo "  OS License   : $LICENSE"
echo "================================================"
