#!/bin/bash

echo "This is an improved password generator"

while true; do
    echo "Please enter the length of the password (minimum 8 characters)"
    read PASS_LENGTH

    if [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]] && [ "$PASS_LENGTH" -ge 8 ]; then
        break
    else 
        echo "Invalid input. Please enter a number 8 or greater"
        echo "Do you want to try again? (y/n)"
        read answer
        if [[ "$answer" != "y" ]]; then
            echo "Exiting script"
            exit 1
        fi
     fi
done

#Ensure minimum length of 8 condition
if ! [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]] || [ "$PASS_LENGTH" -lt 8 ]; then
    PASS_LENGTH=8
    echo "Invalid input. Minimum length set to 8 characters"
fi

# Function to generate password at least two special characters
gen_passwd() {
    local pass_length=$1
    # Generate base password
    base_pass=$(openssl rand -base64 48 | tr -dc 'a-zA-Z0-9' | cut -c1-$((pass_length - 2)))

    # Generate two random special characters
    special_chars=$(echo '!@#$%^&*()_+-=[]{}|;:,.<>?' | fold -w1 | shuf | head -n2 | tr -d '\n')

    # Combine and shuffle
    password=$(echo "${base_pass}${special_chars}" | fold -w1 | shuf | tr -d '\n')

    echo "$password"
}

# Generate 5 passwords
for p in $(seq 1 5); do
    gen_passwd "$PASS_LENGTH"
done

