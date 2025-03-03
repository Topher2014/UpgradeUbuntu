#!/bin/bash

# Ensure the script is scheduled in cron
if  crontab -l | grep -q "@reboot /home/ubuntu/UpgradeUbuntu.sh"  
then  
  echo "Cron job is scheduled"
else
  echo "Adding script to cron for auto-execution after reboot"
  (crontab -l; echo "@reboot /home/ubuntu/UpgradeUbuntu.sh") | crontab -
fi

# The newest version should exist and the package list should be updated
if grep -q 'VERSION_ID="22.04"' /etc/os-release  
then  
  echo "Ubuntu version is already 22.04"
else  
  echo "Ubuntu version is lower than required (22.04). Updating system"  
  sudo apt update && sudo apt upgrade -y
fi  

if [ ! -f /var/run/reboot-required ]
then
  echo "Reboot not required."
else
  echo "Reboot required, rebooting now"
  sudo reboot
fi
