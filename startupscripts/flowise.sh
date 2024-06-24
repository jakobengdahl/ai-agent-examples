#!/bin/bash

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# Run the rest of the commands in a subshell
(
  # Source the .bashrc file to load fnm
  source /home/onyxia/.bashrc

  # Use fnm to install Node.js version 20 if it's not already installed
  fnm use --install-if-missing 20

  # Install flowise globally using npm
  npm install -g flowise

  # Start flowise on port 9898
  npx flowise start --PORT=9898 &
)
