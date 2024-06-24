#!/bin/bash

# Download and install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# Export environment variables and evaluate fnm env directly
FNM_PATH="/home/onyxia/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

# Use fnm to install Node.js version 20 if it's not already installed
fnm use --install-if-missing 20

# Install flowise globally using npm
npm install -g flowise

# Start flowise on port 9898
npx flowise start --PORT=9898 &
