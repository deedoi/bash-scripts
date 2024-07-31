#!/bin/bash

# Set the path to mtr binary
MTR_PATH="/usr/local/Cellar/mtr/0.95/sbin/mtr"

# Function to ensure mtr is available in the path
setup_mtr() {
    if [ ! -f "$MTR_PATH" ]; then
        echo "Error: mtr not found at $MTR_PATH"
        exit 1
    fi
    sudo cp "$MTR_PATH" /usr/local/bin/
}

# Function for real-time view
realtime_view() {
    echo "Running real-time view..."
    sudo mtr -b -y 2 -oLDRSWNBAWVJMXI 1.1.1.1
}

# Function for 1000 packet report
packet_report() {
    echo "Running 1000 packet report..."
    sudo mtr -n -y 2 -rwc 1000 -oLDRSWNBAWVJMXI 8.8.8.8 >> /Users/doimba/Desktop/mtr_report.txt
    echo "Report saved to /Users/doimba/Desktop/mtr_report.txt"
}

# Function for TCP 443 traffic analysis
tcp_443_analysis() {
    echo "Running TCP 443 traffic analysis..."
    sudo mtr -rwc 300 -n -T -P 443 dns.google.com >> /Users/doimba/Desktop/tcp_mtr_report.txt
    echo "Report saved to /Users/doimba/Desktop/tcp_mtr_report.txt"
}

# Main menu
main_menu() {
    echo "Please select an option:"
    echo "1) Real-time view"
    echo "2) 1000 packet report"
    echo "3) TCP 443 traffic analysis"
    echo "4) Exit"
    read -p "Enter your choice (1-4): " choice

    case $choice in
        1) setup_mtr && realtime_view ;;
        2) setup_mtr && packet_report ;;
        3) setup_mtr && tcp_443_analysis ;;
        4) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again."; main_menu ;;
    esac
}

# Run the main menu
main_menu


