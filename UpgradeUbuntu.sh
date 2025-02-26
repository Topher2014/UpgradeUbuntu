#!/bin/bash

# The newest version should exist and the package list should be updated
if grep -q 'VERSION_ID="22.04"' /etc/os-release  
then  
  echo "Ubuntu version is already 22.04"
else  
  echo "Ubuntu version is lower than required (22.04). Updating system"  
  sudo apt update && sudo apt upgrade -y

  echo "System update completed. Rebooting now"
  sudo reboot
fi  

# After reboot, wait for the VM state to be "Running"
echo "Waiting for VM to complete reboot"
while [ "$(multipass list | awk '/magical-vm/ {print $2}')" != "Running" ]  
do  
  echo "VM is still restarting"
done

echo "VM rebooted successfully"

