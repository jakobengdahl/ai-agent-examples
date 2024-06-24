#!/bin/bash
curl -fsSL https://fnm.vercel.app/install | bash
source /home/onyxia/.bashrc
fnm use --install-if-missing 20
npm install -g flowise
npx flowise start --PORT=9898 &
