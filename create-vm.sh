if (multipass info magical-vm)
 then
  echo "The VM already exists"
 else
  echo "✨‍‍🧙‍ Creating a magical vm  for you. One moment...🪄✨‍‍"
  multipass launch core18 --name magical-vm
  multipass info magical-vm
fi
