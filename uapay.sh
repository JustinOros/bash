#!/bin/bash
#################################################
# Query Univeristy of Arizona payroll information
# Written by Justin Oros
# Usage: uapay.sh FirstName LastName
#################################################

# Check to see if BASH is installed
{
if [ ! -f /bin/bash ]; then
    echo "Bash not found!"
    exit 0
fi
}

# Check to see if CURL is installed
{
if [ ! -f /usr/bin/curl ]; then
    echo "Curl not found!"
    exit 0
fi
}

# Check to see if GREP is intalled
{
if [ ! -f /usr/bin/grep ]; then
    echo "Grep not found!"
    exit 0
fi
}

# URL for UA Salaries
uapay_url='https://openpayrolls.com/employee'

# User Agent
uapay_useragent='Chrome/79'

# Get Input from User
{
if [ -z "$1" ] || [ -z "$2" ]; then
    echo -e "\nUsage: uapay.sh FirstName LastName\n"
    exit 0
else
    uapay_name=$1-$2
fi
}

# Grep Filter
uapay_filter="and a pay of"

# Query URL
uapay_output=$(curl -s -k --user-agent $uapay_useragent $uapay_url/$uapay_name-4329 | grep "$uapay_filter")

# Check output
{
if [ -z "$uapay_output" ]; then
    echo -e "\n$1 $2 was not found.\n"
    exit 0
fi
}

# Format output
uapay_output=${uapay_output/\<p class=\"lead font-16 font-weight-400\"\>/}
uapay_output=${uapay_output/\<\/p\>/}

# Print output
echo -e "\n$uapay_output\n"
