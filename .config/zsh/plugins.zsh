# Check zplug installation
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source "$ZPLUG_HOME/init.zsh" && zplug update --self
fi
source "$ZPLUG_HOME/init.zsh"

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
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
