#!/usr/bin/env bash
# ===============================
# Date: 11/08/2025
# Description: Greets the user by name if provided, otherwise
#              displays a usage message and exits with an error.  
# ===============================

# Check the number of arguments
if [ "$#" -eq 1 ]; then
    name="$1"
    echo "Hello, $name"
else
    echo "Usage: error_handling.sh <person>" >&2
    exit 1
fi