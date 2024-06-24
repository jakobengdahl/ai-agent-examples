#!/bin/bash

# Download and install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# Execute the following commands in a new bash session
bash -c '
  source /home/onyxia/.bashrc
  fnm use --install-if-missing 20
  npm install -g flowise
  npx flowise start --PORT=9898 &
'
