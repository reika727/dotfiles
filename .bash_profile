export PKG_CONFIG_PATH=/usr/local/opencv/opencv-4.7.0/lib/pkgconfig/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "$HOME/.environment" ]; then
  source "$HOME/.environment"
fi

source "$HOME/.profile"
