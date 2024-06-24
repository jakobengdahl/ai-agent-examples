#!/bin/bash

# Check for dependencies
echo "Checking dependencies for the installation script..."
command -v curl >/dev/null 2>&1 || { echo >&2 "curl is required but it's not installed. Aborting."; exit 1; }
echo "Checking availability of curl... OK!"
command -v unzip >/dev/null 2>&1 || { echo >&2 "unzip is required but it's not installed. Aborting."; exit 1; }
echo "Checking availability of unzip... OK!"

# Download and install fnm
echo "Downloading https://github.com/Schniz/fnm/releases/latest/download/fnm-linux.zip..."
curl -fsSL https://github.com/Schniz/fnm/releases/latest/download/fnm-linux.zip -o fnm-linux.zip
unzip -o fnm-linux.zip -d ~/.local/share/fnm

# Update .bashrc
echo "Installing for Bash. Appending the following to /home/onyxia/.bashrc:"
cat <<'EOF' >> /home/onyxia/.bashrc

# fnm
FNM_PATH="/home/onyxia/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
EOF

# Apply the changes to the current shell
echo "Sourcing /home/onyxia/.bashrc to apply changes..."
source /home/onyxia/.bashrc

# Use fnm to install Node.js version 20 if it's not already installed
eval "$(fnm env)"
fnm use --install-if-missing 20

# Install flowise globally using npm
npm install -g flowise

# Start flowise on port 9898
npx flowise start --PORT=9898 &
