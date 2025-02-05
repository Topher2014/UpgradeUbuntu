if (multipass info mythical-vm)
 then
  echo "The VM already exists"
 else
  echo "✨🔮 Creating a mythical vm  for you. One moment... 🧙‍"
  multipass launch core18 --name mythical-vm
  multipass info mythical-vm
fi
