#!/bin/bash

echo "This is a simple password generator"
echo "Please enter the length of the password (min 8 chars)"
read PASS_LENGTH

LOWER='abcdefghijklmnopqrstuvwxyz'
UPPER='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
NUMBERS='0123456789'
SPECIAL_CHARS='!@#$%^&*()_+-=[]{}|;:,.<>?'
ALL_CHARS="${LOWER}${UPPER}${NUMBERS}${SPECIAL_CHARS}"

for i in $(seq 1 5); do
    # Generate base password
    PASSWORD=$(openssl rand -hex 32 | tr -dc "${ALL_CHARS}" | head -c $((PASS_LENGTH - 3)))
    
    # Add one uppercase letter
    PASSWORD="${PASSWORD}${UPPER:$((RANDOM % ${#UPPER})):1}"
    
    # Add two random special characters
    PASSWORD="${PASSWORD}${SPECIAL_CHARS:$((RANDOM % ${#SPECIAL_CHARS})):1}"
    PASSWORD="${PASSWORD}${SPECIAL_CHARS:$((RANDOM % ${#SPECIAL_CHARS})):1}"
    
    # Shuffle the password
    SHUFFLED_PASSWORD=""
    while [ ${#PASSWORD} -gt 0 ]; do
        n=$((RANDOM % ${#PASSWORD}))
        SHUFFLED_PASSWORD="${SHUFFLED_PASSWORD}${PASSWORD:$n:1}"
        PASSWORD="${PASSWORD:0:$n}${PASSWORD:$((n+1))}"
    done
    
    echo $SHUFFLED_PASSWORD
done
