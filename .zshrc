### VARIABLES ###

# Path
export PATH=/usr/local/bin:/opt/local/bin:$HOME/bin:$HOME/.local/bin:$PATH

# Default folders
export XDG_CONFIG_HOME="$HOME/.config"
export ZPLUG_HOME="$XDG_CONFIG_HOME/zsh/zplug"

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default programs
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='google-chrome-stable'

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### DEFAULT SETTINGS ###
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify menucomplete
precmd () {print -Pn "\e]0;%c\a"}

### CUSTOM SETTINGS ##
source $XDG_CONFIG_HOME/zsh/aliases.zsh
source $XDG_CONFIG_HOME/zsh/plugins.zsh
source $XDG_CONFIG_HOME/zsh/prompt.zsh

### COMPLETION ### 
zstyle :compinstall filename '/home/yesidd/.zshrc'
autoload -Uz compinit
compinit
