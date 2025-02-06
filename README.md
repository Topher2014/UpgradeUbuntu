# Ubuntu Upgrade Project

# Project commands:

# 1
To start the project on a Mac run:
`bash setup-mac.sh' 

To start project on linux run:
`bash setup-linux.sh`

# 2
To transfer file from local to vm, cd to UpgradeUbuntu and run the following command:
`multipass transfer create-vm.sh magical-vm:/home/ubuntu/create-vm.sh`

# 3
To install an older version of Ubuntu in the VM shell into your multipass VM and run the  script: 
`multipass shell magical-vm`

Inside the vm run 
`bash create-vm.sh`

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
3. Run the ubuntu install script in the vm 👨💻👩💻🧑💻
4. Once the older version of Ubuntu is running in the VM, upgrade it to the newest/current version of Ubuntu (which is 24.10)🎉💻
Note - By default, when you use Multipass you get the most recent version.
