#!/bin/bash

# Ensure the script is scheduled in cron
if  crontab -l | grep  "@reboot /home/ubuntu/UpgradeUbuntu.sh"  
then  
  echo "Cron job is scheduled"
else
  echo "Adding script to cron for auto-execution after reboot"
  (crontab -l; echo "@reboot /home/ubuntu/UpgradeUbuntu.sh") | crontab -
fi

# Check if the system is already fully upgraded
if ! sudo do-release-upgrade --check-dist | grep "New release"  
then  
  echo "No new Ubuntu release available. System is fully upgraded"
  echo "Removing cron job to prevent unnecessary execution"
  sudo crontab -l | grep -v "@reboot /home/ubuntu/UpgradeUbuntu.sh" | sudo crontab -
else  
  echo "A new Ubuntu release is available. Continuing with update process"
fi 

# Check if apt update is needed
if apt-cache show apt  
then  
  echo "Package list cache is up to date, skipping apt update"
else  
  echo "Package list cache is outdated or missing, running apt update"
  sudo apt update
fi  

# Check if apt upgrade is needed
if ! sudo apt list --upgradable | grep 'upgradable'  
then  
  echo "No package upgrades available. Skipping apt upgrade"
else  
  echo "Upgrades available. Running apt upgrade"
  sudo apt upgrade -y
fi  

# Double-check that updates were actually applied before rebooting
if sudo apt list --upgradable | grep 'upgradable'  
then  
  echo "Updates are still pending. Not rebooting yet"
else  
  echo "Rebooting after system update"
  sudo reboot
fi  

# Check if Ubuntu is already up to date
if grep  'VERSION_ID="' /etc/os-release  
then  
  echo "Current Ubuntu version:"
  grep 'VERSION_ID="' /etc/os-release
else  
  echo "Could not determine current Ubuntu version."
fi
 
# Check if a new Ubuntu release is available
if ! sudo do-release-upgrade --check-dist | grep -q "New release"  
then  
  echo "No new Ubuntu release available"
else  
  echo "A new Ubuntu release is available. Running upgrade"
  sudo do-release-upgrade --check-dist | grep "New release"
  echo "Upgrading system"
  sudo do-release-upgrade -f DistUpgradeViewNonInteractive
  echo "Rebooting after full system upgrade"
  sudo reboot
fi 
