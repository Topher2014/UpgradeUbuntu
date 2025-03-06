#!/bin/bash

# Redirect all output to a log file for debugging
LOG_FILE=$(mktemp /home/ubuntu/UbuntuUpgrade_log.XXXXXX)
exec > >(tee -a "$LOG_FILE") 2>&1

# Print each command before executing it
set -x

# Ensure the script is scheduled in cron
if crontab -l | grep "@reboot /home/ubuntu/UpgradeUbuntu.sh"
then
  echo "Cron job is scheduled"
else
  echo "Adding script to cron for auto-execution after reboot"
  (crontab -l; echo "@reboot /home/ubuntu/UpgradeUbuntu.sh > /home/ubuntu/upgrade_log.txt 2>&1") | crontab -
fi

# The newest version should exist and the package list should be updated
if [ $(sudo apt list --upgradable | grep -c 'upgradable') -eq 0 ]
then
  echo "No updates needed. System is up to date"
  grep "VERSION_ID=" /etc/os-release
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
if dpkg --compare-versions $(lsb_release -rs) ge 24.04.2
then
  echo "No new Ubuntu release available"
else
  echo "A new Ubuntu release is available. Running upgrade"
  sudo do-release-upgrade -f DistUpgradeViewNonInteractive
fi

# Check if a reboot is required after the upgrade
if [ ! -f /var/run/reboot-required ]
then
  echo "No reboot required after Ubuntu upgrade"
else
  echo "Reboot required to complete the upgrade. Rebooting now"
  sudo reboot
fi

# Ensure the cron job remains until the system is fully upgraded
if ! lsb_release -r | grep "24.04.2"
then  
  echo "Cron job remains scheduled"
else  
  echo "System is fully upgraded. Removing script from cron"
  crontab -l | grep -v "@reboot /home/ubuntu/UpgradeUbuntu.sh" | crontab -
fi

echo "Log file: $LOG_FILE"
