curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
nvm install 22

# Install flowise globally using npm
npm install -g flowise

# Start flowise on port 9898
npx flowise start --PORT=9898 &
