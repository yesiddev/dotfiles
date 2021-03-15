### Environment Variables ###

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default programs
export EDITOR='nvim'
export TERMINAL='kitty'
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

### Plugins Admin ###
if [[ ! -d $XDG_CONFIG_HOME/zplug ]]; then
  git clone https://github.com/zplug/zplug $XDG_CONFIG_HOME/zplug
  source $XDG_CONFIG_HOME/zplug/init.zsh && zplug update --self
fi
source $XDG_CONFIG_HOME/zplug/init.zsh

zplug 'lib/git', from:oh-my-zsh
zplug 'lib/theme-and-appearance', from:oh-my-zsh

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

### Aliases ###
source ~/.config/zsh/aliases.zsh

### Prompt ###
source ~/.config/zsh/zprompt.zsh

### Completion system ###
zstyle :compinstall filename '/home/yesidd/.zshrc'
autoload -Uz compinit
compinit
