#!/bin/bash

# Ensure the script is scheduled in cron
if  crontab -l | grep  "@reboot /home/ubuntu/UpgradeUbuntu.sh"  
if crontab -l | grep -q "@reboot /home/ubuntu/UpgradeUbuntu.sh"  
then  
  echo "Cron job is scheduled"
else
  echo "Adding script to cron for auto-execution after reboot"
  (crontab -l; echo "@reboot /home/ubuntu/UpgradeUbuntu.sh") | crontab -
fi
 
# The newest version should exist and the package list should be updated
if sudo apt list --upgradable | grep 'upgradable' && grep 'VERSION_ID="' /etc/os-release  
then  
  echo "No updates needed. System is up to date"
  grep 'VERSION_ID="' /etc/os-release
else  
  echo "Updates available or system version not detected. Running apt update and upgrade"
  sudo apt update && sudo apt upgrade -y
fi  

# Check if a reboot is required before upgrading Ubuntu
if [ ! -f /var/run/reboot-required ]  
then  
  echo "No reboot required before upgrading Ubuntu"
else  
  echo "Reboot required before upgrading Ubuntu. Rebooting now"
  sudo reboot
fi  

# Check if a new Ubuntu release is available
if ! sudo do-release-upgrade --check-dist | grep "New release"  
then  
  echo "No new Ubuntu release available"
else  
  echo "A new Ubuntu release is available. Running upgrade"
  sudo do-release-upgrade -f DistUpgradeViewNonInteractive
fi  

#commented out for now
# Check if a reboot is required after the upgrade
#if [ ! -f /var/run/reboot-required ]  
#then  
 # echo "No reboot required after Ubuntu upgrade"
#else  
 # echo "Reboot required to complete the upgrade. Rebooting now"
#fi 
