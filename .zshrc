### Environment Variables ###

# Default folders
export XDG_CONFIG_HOME="$HOME/.config"
#export QT_STYLE_OVERRIDE=kvantum
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

### Default Settings ###
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
precmd () {print -Pn "\e]0;%c\a"}

### Custom Settings ##
source $XDG_CONFIG_HOME/zsh/plugins.zsh
source $XDG_CONFIG_HOME/zsh/zprompt.zsh
source $XDG_CONFIG_HOME/zsh/aliases.zsh

### Completion system ###
zstyle :compinstall filename '/home/yesidd/.zshrc'
autoload -Uz compinit
compinit
