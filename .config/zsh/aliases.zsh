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
alias pjr='cd $HOME/Projects/_repos'
alias pjp='cd $HOME/Projects/_practice'

# Dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dota='dot add'
alias dotc='dot commit -m'
alias dotp='dot push'
alias dots='dot status'

# Config files
alias :zsh='v ~/.zshrc'
alias :term='v ~/.config/kitty/kitty.conf'
alias :editor='v ~/.config/nvim/init.vim'
alias :alias='v ~/.config/zsh/aliases.zsh'
alias :prompt='v ~/.config/zsh/zprompt.zsh'
alias :qtile='v ~/.config/qtile/config.py'
alias crsa='xclip -selection clipboard < ~/.ssh/id_rsa.pub'

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

# Handle file management
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias md='mkdir -p'
alias rf='rm -rf'

# System utilities
alias c='clear'
alias fonts='fc-cache -f -v'
alias reset='cd ~; clear; source ~/.zshrc'
alias mine='chmod -R a-x,o-w,+X'
alias modx='chmod +x'

# NPM
alias ni='npm install'
alias nig='npm install -g'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias niu='npm install -g npm@latest'
alias nu='npm update'
alias nug='npm update -g'
alias npmi='npm init -y'
