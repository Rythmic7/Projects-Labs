#!/usr/bin/env bash
# ===============================
# Date: 11/09/2025
# Description: Determines whether a given year is a leap year based on
#              Gregorian calendar rules.
# ===============================

# A year is a leap year if divisible by 4,
# except for years divisible by 100   
leap_check() {
    if [ $(expr $1 % 4) -eq 0 ]; then
        if [ $(expr $1 % 100) -eq 0 ]; then
            if [ $(expr $1 % 400) -eq 0 ]; then
                echo "true"
            else
                echo "false"
            fi
        else
            echo "true"
        fi
    else
        echo "false"
    fi
}

# Validate input: must be one numeric argument
if ! [ "$1" -eq "$1" ] 2>/dev/null || [ $# -ne 1 ]; then
    echo "Usage: leap.sh <year>"
    exit 1
else
    leap_check "$@"
fi
