
if (multipass info magical-vm)
 then
  echo "The VM already exists"
 else
  echo "✨‍‍🧙‍ Creating a magical vm  for you. One moment...🪄✨‍‍"
  multipass launch 20.04 --name magical-vm --mem 2G --disk 10G --cpus 2
  multipass info magical-vm
fi
