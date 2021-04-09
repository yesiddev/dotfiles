#!/usr/bin/env bash
{
clear
echo "Instalación de dotfiles"
echo "-----------------------------------------------------"

# Clone dotfiles
cd $HOME
mkdir .dotfiles
git clone --bare https://github.com/yesiddev/dotfiles.git $HOME/.dotfiles
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)]Repositorio clonado con éxito"
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f main
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)]Configuraciones copiadas con éxito"

echo ""
read -p "Presiona Enter y teclea reboot..."
}
