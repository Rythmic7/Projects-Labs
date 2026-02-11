#!/usr/bin/env bash
# ===============================
# Date: 11/09/2025
# Description: Converts a given phrase into its acronym by removing
#              punctuation and replacing hyphens with spaces.
# ===============================

phrase=$1

# Replace hyphens with spaces
phrase=$(echo "$phrase" | tr '-' ' ')

# Remove punctuation
phrase=$(echo "$phrase" | tr -d '[:punct:]')

acronym=""

# Loop through each word and take the first letter (capitalized)
for word in $phrase; do
  first_letter=$(echo "${word:0:1}" | tr '[:lower:]' '[:upper:]')
  acronym="$acronym$first_letter"
done

# Output the resulting acronym
echo "$acronym"
