# Ubuntu Upgrade Project

# Project commands:

# 1
To start the project on a Mac run:
`bash setup-mac.sh` 

To start project on linux run:
`bash setup-linux.sh`

To create the vm run:
`bash create-vm.sh`

# 2
To transfer file from local to vm, cd to UpgradeUbuntu and run the following command:
`multipass transfer UpgradeUbuntu.sh magical-vm:/home/ubuntu/UpgradeUbuntu.sh && multipass exec magical-vm -- chmod +x /home/ubuntu/UpgradeUbuntu.sh`
 
 # To run the script from outside the vm, run:
      `multipass exec magical-vm -- /home/ubuntu/UpgradeUbuntu.sh`

# 3
To run the script from inside the VM, shell into your multipass VM and run the script: 
`multipass shell magical-vm`

Inside the vm run 
`bash UpgradeUbuntu.sh`

## Notes about running the script outside the VM:
- after the first reboot, your local computer loses connection to the VM, therefore losing access to the output of the remainder of the script
- the remaining script takes from 10 minutes - several hours to complete when running for the first time
- there are several ways to monitor the progress of the script while it is running

### These commands will help you debug and monitor the script after each reboot

| **Command** | **Purpose** |
|------------|------------|
| `multipass exec magical-vm -- ps aux | grep UpgradeUbuntu.sh` | Check if the script is running |
| `multipass exec magical-vm -- test -f /var/run/reboot-required && echo "Reboot required" || echo "No reboot required"` | Check if a reboot is needed |
| `multipass exec magical-vm -- grep "VERSION_ID=" /etc/os-release` | Check the current Ubuntu version |
| `multipass exec magical-vm -- crontab -l` | Verify if the cron job is still scheduled |
| `multipass exec magical-vm -- cat /home/ubuntu/upgrade_log.txt` | View the script’s log output |

# Additional Info
To delete all VM's created with multipass run:
`multipass delete --all --purge`

To remove multipass from your linuxmint machine run:
`sudo snap remove multipass`

To remove multipass from your Mac machine run:
`brew uninstall --zap multipass`


What we aim to do is:
1. Create a script that builds a vm 
2. Build a vm using a script that installs an outdated or not current version of Ubuntu 🤓
3. Run the ubuntu install script froom outside the vm, or alternatelly in the vm 👨💻👩💻🧑💻
4. Once the older version of Ubuntu is running in the VM, upgrade it to the newest/current version of Ubuntu (which is 24.04.2)🎉💻
Note - By default, when you use Multipass you get the most recent version.
