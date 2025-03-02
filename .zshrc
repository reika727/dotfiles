# Define secret environment variables (if exists)
if [ -f "$HOME/.environment" ]; then
  source "$HOME/.environment"
fi

# fortune | cowsay | DeepL
if [ -x /usr/games/fortune ] && [ -x /usr/games/cowsay ]; then
  function deepl() {
    ESCAPED=$(echo "$1" | jq --slurp --raw-input)

    DATA=$(
      jq --null-input \
         --compact-output \
         --argjson 'text' "[$ESCAPED]" \
         --arg 'target_lang' 'JA' \
         --arg 'split_sentences' 'nonewlines' \
         '$ARGS.named'
      )

    TRANSLATED=$(
      curl --silent \
           --variable '%DEEPL_AUTHORIZATION_KEY' \
           --request 'POST' 'https://api-free.deepl.com/v2/translate' \
           --expand-header 'Authorization: DeepL-Auth-Key {{DEEPL_AUTHORIZATION_KEY}}' \
           --header 'Content-Type: application/json' \
           --data "$DATA" \
      | jq --raw-output '.translations[].text'
    )

    eval "$2='${TRANSLATED//\'/\'\\\'\'}'"
  }

  function show-motd() {
    FORTUNE=$(/usr/games/fortune)
    deepl "$FORTUNE" TRANSLATED_FORTUNE
    echo -e "$FORTUNE\n\n$TRANSLATED_FORTUNE" \
    | /usr/games/"$(shuf --echo --head-count=1 cowsay cowthink)" \
      -f "$(/usr/games/cowsay -l | tail --lines=+2 | xargs shuf --echo --head-count=1)" \
      -"$(shuf --echo --head-count=1 b d g p s t w y)"
  }

  show-motd
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/reika727/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zplug/init.zsh

zplug romkatv/powerlevel10k, as:theme, depth:1
zplug 'plugins/git', from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set $LS_COLORS
eval "$(dircolors)"

# Do not create .lesshst
export LESSHISTFILE=-

# Define keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Define aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# zsh custom settings
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${LS_COLORS}
setopt hist_ignore_dups
setopt extended_history
setopt inc_append_history

# pkg-config settings
export PKG_CONFIG_PATH=/usr/local/opencv/opencv-4.7.0/lib/pkgconfig/

# NVM (Node Version Manager) settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GHCup settings
[ -f "/home/reika727/.ghcup/env" ] && . "/home/reika727/.ghcup/env" # ghcup-env
