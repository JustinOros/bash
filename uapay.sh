#!/bin/bash
# Description: Query UofA employee payroll data via CLI
# Usage: uapay.sh <first name> <last name>
# Author: Justin Oros
# Source: https://github.com/JustinOros

# BASH present?
if [ ! -f /bin/bash ]; then
    echo "Bash not found!"
    exit 0
fi

# CURL present?
if [ ! -f /usr/bin/curl ]; then
    echo "Curl not found!"
    exit 0
fi

# GREP present?
if [ ! -f /usr/bin/grep ]; then
    echo "Grep not found!"
    exit 0
fi

# UA Payroll URL
uapay_url='https://openpayrolls.com/employee'

# User Agent
uapay_useragent='Chrome/79'

# Get Input
if [ -z "$1" ] || [ -z "$2" ]; then
    echo -e "\nUsage: uapay.sh FirstName LastName\n"
    exit 0
else
    for i in "$@"
    do
        uapay_name="$@"
    done
fi

# Format Input
uapay_formatted_name=${uapay_name// /-}-4329

# Grep Filter
uapay_filter="and a pay of"

# Query URL
uapay_query=$(curl -s -k --user-agent $uapay_useragent $uapay_url/$uapay_formatted_name | grep "$uapay_filter")

# Check Results
if [ -z "$uapay_query" ]; then
    echo -e "\n$uapay_name was not found.\n"
    exit 0
fi

# Format Output
uapay_query=${uapay_query/\<p class=\"lead font-16 font-weight-400\"\>/}
uapay_query=${uapay_query/\<\/p\>/}

# Print Output
echo -e "\n$uapay_query\n"
