#!/usr/bin/env bash

##########################################
# Secure Log Analysis Script
# Purpose: Analyze system logs for security threats
##########################################

# =========================
# I. EXECUTION AND INPUT VALIDATION
# =========================

# 1. Usage Check - Verify exactly one argument provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

# Store the log file path
LOG_FILE="$1"

# 2. File Validation - Check if file exists and is readable
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

if [ ! -r "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' is not readable."
    exit 1
fi

# 3. Total Line Count - Calculate total lines in log file
TOTAL_LINES=$(wc -l < "$LOG_FILE")

# =========================
# II. CORE ANALYSIS AND FILTERING
# =========================

# 1. Event Filtering - Extract lines with security keywords
SECURITY_EVENTS=$(grep -iE "(Failed password|Invalid user|authentication failure)" "$LOG_FILE")

# Count total security events found
if [ -z "$SECURITY_EVENTS" ]; then
    TOTAL_EVENTS=0
else
    TOTAL_EVENTS=$(echo "$SECURITY_EVENTS" | wc -l)
fi

# 2. IP Extraction and Counting/Aggregation
# Extract IPv4 addresses and count occurrences
if [ $TOTAL_EVENTS -gt 0 ]; then
    IP_COUNTS=$(echo "$SECURITY_EVENTS" | \
                awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $i}' | \
                sort | \
                uniq -c | \
                sort -rn)
else
    IP_COUNTS=""
fi

# =========================
# III. REPORTING
# =========================

# Get current date and time
CURRENT_DATE=$(date +"%Y-%m-%dT%H:%M:%S%:z")

# Generate Report Header
echo "###############################################################"
echo "## Team: Ouroboros                                           ##" 
echo "## Security Log Analysis Report                              ##"
echo "## Log File: $LOG_FILE                                       ##"
echo "## Run Date: $CURRENT_DATE                                   ##"
echo "###############################################################"
echo ""

# Summary Statistics
echo "### 1. Summary Statistics ###"
echo "* Total Lines Processed: $TOTAL_LINES"
echo "* Potential Security Events Found: $TOTAL_EVENTS"
echo ""

# Top 5 Suspicious IP Addresses
echo "### 2. Top 5 Suspicious IP Addresses (Failed Auth Attempts) ###"
echo "# IP Address       | Count"
echo "---------------------------"
if [ -n "$IP_COUNTS" ]; then
    echo "$IP_COUNTS" | head -5 | awk '{printf "%-18s | %s\n", $2, $1}'
else
    echo "No suspicious IP addresses found."
fi
echo ""

# Raw Event Examples (First 10)
echo "### 3. Raw Event Examples (First 10) ###"
if [ $TOTAL_EVENTS -gt 0 ]; then
    echo "$SECURITY_EVENTS" | head -10
else
    echo "No security events to display."
fi

# Optional: Highlight IPs with more than 10 failed attempts
echo ""
echo "### 4. High-Risk IPs (More than 10 failed attempts) ###"
if [ -n "$IP_COUNTS" ]; then
    echo "$IP_COUNTS" | awk '$1>10 {printf "%-18s | %s\n", $2, $1}'
else
    echo "No high-risk IPs detected."
fi

# Exit successfully
exit 0
