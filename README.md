# IP Range Port Scanner

This Bash script allows users to scan a range of IP addresses for open ports using nmap.

## Features

- Scans a user-specified range of IP addresses
- Checks for a specific port number across the IP range
- Uses nmap for efficient and reliable scanning
- Outputs results in a grepable format
- Filters and displays only open ports

## Prerequisites

- Bash shell
- nmap (Network Mapper) installed on your system

## How it works

1. The script prompts for user input to define the IP range and target port.
2. It uses nmap to perform a TCP connect scan (-sT) on the specified IP range and port.
3. The results are saved in a grepable format (-oG).
4. The script then filters the results to show only open ports.