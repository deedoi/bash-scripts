#!/bin/bash

echo "Enter the start IP address range (e.g., 10.0.0.1) : "
read StartIP

echo "Enter the end number of the IP address range (e.g., 99 or 254) : "
read EndIP

echo "Enter the port number you want to scan for : "
read port

nmap -sT $StartIP-$EndIP -p $port > /dev/null -oG Portscan

cat Portscan | grep open > Portscan2

cat Portscan2






