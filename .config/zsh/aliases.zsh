# LS
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -lavh'

# Editor
alias sv='sudoedit'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Directories
alias pj='cd $HOME/Projects'
alias dw='cd $HOME/Downloads'
alias dd='cd $HOME/Documents'
alias pr='cd $HOME/Projects/_repos'
alias pp='cd $HOME/Projects/_practice'

# Dotfiles
alias dg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dga='dg add'
alias dgc='dg commit -m'
alias dgp='dg push'
alias dgs='dg status'

# Config files
alias :alacritty='v ~/.config/alacritty/alacritty.yml'
alias :alias='v ~/.config/zsh/aliases.zsh'
alias :bspwm='v ~/.config/bspwm/bspwmrc'
alias :nvim='v ~/.config/nvim/init.vim'
alias :qtile='v ~/.config/qtile/config.py'
alias :sxhkd='v ~/.config/sxhkd/sxhkdrc'
alias :zplug='v ~/.config/zsh/plugins.zsh'
alias :zprompt='v ~/.config/zsh/zprompt.zsh'
alias :zsh='v ~/.zshrc'

# Git
alias g='git'
alias ga='git add'
alias gu='git add -u'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'

# Pacman
alias paci='sudo pacman -S --needed --noconfirm'
alias pacu='sudo pacman -Syu --noconfirm'
alias pacr='sudo pacman -Rsn --noconfirm'
alias pacro='sudo pacman -Rs $(pacman -Qtdq) --noconfirm'
alias pacls='sudo pacman -Ql'

# Yay
alias yayi='yay -S --noconfirm'
alias yayr='yay -Rns --noconfirm'
alias yayu='yay -Syu --noconfirm'

# File management
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias md='mkdir -p'
alias rd='rm -rf'
alias vf='vifmrun'

# System utilities
alias c='clear'
alias fonts='fc-cache -f -v'
alias reset='cd ~; clear; source ~/.zshrc'
alias mine='chmod -R a-x,o-w,+X'
alias modx='chmod +x'
alias crsa='xclip -selection clipboard < ~/.ssh/id_rsa.pub'

# NPM
alias ni='npm install'
alias nig='npm install -g'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias niu='npm install -g npm@latest'
alias nu='npm update'
alias nug='npm update -g'
alias npmi='npm init -y'
