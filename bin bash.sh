#!/bin/bash

# Run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Get a list of all network interfaces except 'lo' (loopback)
interfaces=$(ls /sys/class/net | grep -v lo)

# Iterate through each interface and change its MAC address
for iface in $interfaces; do
    echo "Changing MAC address for interface: $iface"
    sudo macchanger -bia "$iface"
    echo "---------------------------------------------"
done

echo "MAC address change complete for all interfaces."

