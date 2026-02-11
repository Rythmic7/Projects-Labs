#!/usr/bin/env bash
# ===============================
# Date: 11/09/2025
# Description: Validates a North American phone number (NXX-NXX-XXXX format)
#              ensuring it follows numbering rules: N=2-9 and X=0-9.
# ===============================

# Remove all non-digits from input and validate phone number format
[[ "$(sed 's/[^0-9]//g' <<< "$1")" =~ ^1?(([2-9][0-9]{2}){2}[0-9]{4})$ ]] && { 
    echo "${BASH_REMATCH[1]}"; 
    exit 0; 
}

echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" >&2
exit 1
