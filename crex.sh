#!/bin/bash
# Description: Query Domain Name Creation and Expiration dates.
# Usage: crex.sh <domain.tld>
# Author: Justin Oros
# Source: https://github.com/JustinOros

# Dependency Checks
TARGET_FILE='/usr/bin/whois'
if [ ! -f "$TARGET_FILE" ]
then
    echo "$TARGET_FILE does not exist."
    exit
fi

TARGET_FILE='/usr/bin/grep'
if [ ! -f "$TARGET_FILE" ]
then
    echo "$TARGET_FILE does not exist."
    exit
fi

TARGET_FILE='/usr/bin/awk'
if [ ! -f "$TARGET_FILE" ]
then
    echo "$TARGET_FILE does not exist."
    exit
fi

TARGET_FILE='/usr/bin/head'
if [ ! -f "$TARGET_FILE" ]
then
    echo "$TARGET_FILE does not exist."
    exit
fi

# User Input
DOMAIN_NAME=$1

# Get Creation Date
CREATION_DATE=$(whois $DOMAIN_NAME | grep 'Creation' | awk '{print $3;}' | head -n 1)

# Get Expiration Date
EXPIRATION_DATE=$(whois $DOMAIN_NAME | grep 'Expiration' | awk '{print $5;}')

# Output Results
echo '-'
echo 'Domain:' $DOMAIN_NAME
echo 'Creation:' $CREATION_DATE
echo 'Expiration:' $EXPIRATION_DATE
echo '-'
