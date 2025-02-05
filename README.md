# Ubuntu Upgrade Project

# Project commands:

# 1
To start the project on a Mac run:
bash installVm-mac.sh 

To start project on linux run:
`bash installVm-linux.sh`

# 2
To transfer file from local to vm, cd to UpgradeUbuntu and run the following command:
`multipass transfer ENTER FILE NAME HERE then NAME OF VM then /home/ubuntu/ then without spaces ENTER FILE NAME AGAIN`



# 3
To install an older version of Ubuntu in the VM shell into your multipass VM and run the  script: 
`multipass shell ENTER VM NAME`

Inside the vm run 
`bash ENTER FILE NAME`

# Additional Info
To delete all VM's created with multipass run:
`multipass delete --all --purge`

To remove multipass from your linuxmint machine run:
`sudo snap remove multipass`

To remove multipass from your Mac machine run:
`brew uninstall --zap multipass`



What we aim to do is:
1. Create a script that builds a vm 
2. Build a vm using the script 
3. Create a script that installs an outdated or not current version of Ubuntu 🤓
4. Run the ubuntu install script in the vm 👨💻👩💻🧑💻
5. Once the older version of Ubuntu is running in the VM, upgrade it to the newest/current version of Ubuntu (which is 24.10)🎉💻
Note - By default, when you use Multipass you get the most recent version.
