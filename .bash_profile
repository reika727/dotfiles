export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/games
#export PATH=$PATH:/usr/lib/wsl/lib:/snap/bin
export PKG_CONFIG_PATH=/usr/local/opencv/opencv-4.7.0/lib/pkgconfig/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.profile"
