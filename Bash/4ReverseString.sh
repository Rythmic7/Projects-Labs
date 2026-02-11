#!/usr/bin/env bash
# ===============================
# Date: 11/08/2025
# Description: Reverses a given string entered by the user.
#              Example: "stressed" becomes "desserts".
# ===============================

# Get the string from the first argument
text=$1

# Use 'rev' command to reverse the string
reversed=$(echo "$text" | rev)

# Show the reversed result
echo "$reversed"