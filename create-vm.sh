if (multipass info magical-vm)
 then
  echo "The VM already exists"
 else
  echo "✨‍‍🧙‍ Creating a magical vm  for you. One moment...🪄✨‍‍"
  multipass launch 20.04 --name magical-vm
  multipass info magical-vm
fi
