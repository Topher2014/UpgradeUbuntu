#!/bin/bash


# The newest version should exist and the package list should be updated
if grep -q 'VERSION_ID="22.04"' /etc/os-release  
then  
  echo "Ubuntu version is already 22.04"
else  
  echo "Ubuntu version is lower than required (22.04). Updating system"  
  sudo apt update && sudo apt upgrade -y
fi  

# Check if a reboot is required by continuously checking for the file
echo "Checking if a reboot is required..."
while [ ! -f /var/run/reboot-required ]  
do  
  echo "No reboot required yet. Still checking..."
done

echo "System upgrade completed. Rebooting now..."

# Reboot the system
sudo reboot
