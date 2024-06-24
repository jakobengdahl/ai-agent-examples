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

# Create a temporary script to source .bashrc and run the commands
echo "Creating temporary script to run commands in a new Bash session..."
cat <<'EOS' > /tmp/temp_script.sh
#!/bin/bash
source /home/onyxia/.bashrc
fnm use --install-if-missing 20
npm install -g flowise
npx flowise start --PORT=9898 &
EOS

# Make the temporary script executable
chmod +x /tmp/temp_script.sh

# Run the temporary script in a new Bash session
echo "Running the temporary script in a new Bash session..."
bash /tmp/temp_script.sh
