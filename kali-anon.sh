#!/bin/bash

INTERFACE=$(ip link | grep -v 'lo:' | grep 'state UP' | awk '{print $2}' | sed 's/://' | head -n 1)
if [ -z "$INTERFACE" ]; then
    echo "No active network interface found!"
    exit 1
fi

echo "Changing MAC Address of interface $INTERFACE..."
sudo macchanger -r "$INTERFACE" || { echo "Failed to change MAC Address"; exit 1; }

echo "Configuring firewall..."
sudo ufw reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow out to any port 80,443 proto tcp
sudo ufw enable || { echo "Failed to configure firewall"; exit 1; }

echo "Setting timezone to UTC..."
sudo timedatectl set-timezone UTC || { echo "Failed to set timezone"; exit 1; }

echo "Clearing basic logs (press Ctrl+C to skip)..."
sleep 3  # time to cancel
sudo truncate -s 0 /var/log/syslog
sudo truncate -s 0 /var/log/auth.log

echo "Anonymity configuration completed!"