### Environment Variables ###

# Default folders
export XDG_CONFIG_HOME="$HOME/.config"
export QT_STYLE_OVERRIDE=kvantum
export ZPLUG_HOME="$XDG_CONFIG_HOME/zsh/zplug"

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default programs
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='google-chrome-stable'

# Path
export PATH=/usr/local/bin:/opt/local/bin:$HOME/bin:$HOME/.local/bin:$PATH

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

### Aliases ###
source ~/.config/zsh/aliases.zsh

### Plugins ###
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source "$ZPLUG_HOME/init.zsh" && zplug update --self
fi
source "$ZPLUG_HOME/init.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'hlissner/zsh-autopair', defer:2
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

### Prompt ###
#autoload -U promptinit; promptinit
#prompt spaceship
source ~/.config/zsh/zprompt.zsh

### Completion system ###
zstyle :compinstall filename '/home/yesidd/.zshrc'
autoload -Uz compinit
compinit
