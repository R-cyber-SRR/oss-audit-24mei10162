#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: ROHITH | Course: Open Source Software
# Purpose: Generates a personalised open source philosophy statement
 
# Alias concept demonstrated:
# alias today='date +"%d %B %Y"'
 
echo "================================================"
echo "   Open Source Manifesto Generator"
echo "================================================"
echo "Answer three questions to generate your manifesto."
echo ""
 
# --- User input ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does freedom mean to you?  " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD
 
# --- Date and file ---
DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"
 
# --- Create file ---
> "$OUTPUT"
 
# --- Write content ---
echo "THE OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "Generated: $DATE  |  Author: $AUTHOR" >> "$OUTPUT"
echo "-------------------------------------------" >> "$OUTPUT"
echo "" >> "$OUTPUT"
 
# --- Build manifesto ---
MANIFESTO="Every day, I rely on $TOOL -- a tool built not for profit, but for people."
MANIFESTO="$MANIFESTO To me, freedom means $FREEDOM."
MANIFESTO="$MANIFESTO That is why I build in the open."
MANIFESTO="$MANIFESTO One day, I will share $BUILD freely with the world --"
MANIFESTO="$MANIFESTO because knowledge grows when it is shared."
 
echo "$MANIFESTO" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $AUTHOR | $DATE" >> "$OUTPUT"
 
echo ""
echo "Manifesto saved to: $OUTPUT"
echo "-------------------------------------------"
cat "$OUTPUT"
