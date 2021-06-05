# Make sudo work with aliases
alias sudo='sudo '

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto --group-directories-first'
alias la='ls -lavh'
alias ll='ls -l'

# Editor
alias vi='nvim'
alias vim='nvim'
alias sv='sudoedit'

# Directories
alias dw='cd $HOME/Downloads'
alias dc='cd $HOME/Documents'
alias code='cd $HOME/code'
alias repos='cd $HOME/code/_repos'
alias pp='cd $HOME/code/_practice'
alias site='cd $HOME/code/yesid.dev'

# Config files
alias :alacritty='vim ~/.config/alacritty/alacritty.yml'
alias :aliases='vim ~/.config/zsh/aliases.zsh'
alias :bspwm='vim ~/.config/bspwm/bspwmrc'
alias :kitty='vim ~/.config/kitty/kitty.conf'
alias :prompt='vim ~/.config/zsh/prompt.zsh'
alias :qtile='vim ~/.config/qtile/config.py'
alias :sxhkd='vim ~/.config/sxhkd/sxhkdrc'
alias :vim='vim ~/.config/nvim/init.vim'
alias :zplug='vim ~/.config/zsh/plugins.zsh'
alias :zsh='vim ~/.zshrc'

# Git
alias g='git'
alias ga='git add'
alias gu='git add -u'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'

# dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dota='dot add'
alias dotc='dot commit -m'
alias dotp='dot push'
alias dots='dot status'

# File management
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias md='mkdir -p'
alias rd='rm -rf'
alias vf='vifmrun'
alias vifm='vifmrun'
alias trash='gio trash'
alias empty_trash='gio trash --empty'

# System utilities
alias c='clear'
alias fonts='fc-cache -f -v'
alias reset='cd ~; clear; source ~/.zshrc'
alias modr='chmod -R a-x,o-w,+X'
alias modx='chmod +x'
alias crsa='xclip -selection clipboard < ~/.ssh/id_rsa.pub'
alias mirrors='sudo reflector --latest 10 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Sy'
