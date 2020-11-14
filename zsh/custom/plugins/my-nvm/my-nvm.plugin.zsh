if [[ $OSTYPE == darwin* ]]; then
  export NODE_PATH="/usr/local/lib/node_modules"
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh

else
  # copied from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/nvm/nvm.plugin.zsh

  # Set NVM_DIR if it isn't already defined
  [[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"

  # Load nvm if it exists
  [[ -f "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
fi
