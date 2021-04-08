#!/usr/bin/env bash
{

video=(
arandr
xf86-video-nouveau
xorg
xorg-xinit
xorg-xrandr
)

audio=(
pavucontrol
playerctl
pulseaudio
pulseaudio-alsa
pulseaudio-bluetooth
volumeicon
)

dewm=(
alacritty
feh
firefox
light-locker
lightdm
lightdm-gtk-greeter
lightdm-gtk-greeter-settings
lxsession
picom
qtile
rofi
vifm
)

fonts=(
noto-fonts
ttf-dejavu
ttf-fira-code
ttf-font-awesome
ttf-jetbrains-mono
ttf-liberation
ttf-roboto
ttf-roboto-mono
ttf-ubuntu-font-family
)

files=(
file-roller
gvfs
gvfs-{nfs,mtp,smb}
lzop
p7zip
pcmanfm
sxiv
udiskie
unzip
zip
)

console=(
ffmpegthumbnailer
github-cli
glib2
neofetch
python
python2
ueberzug
xclip
yq
)

utilities=(
code
discord
leafpad
libreoffice-fresh
linux-headers
qalculate-gtk
transmission-{cli,gtk}
virtualbox
virtualbox-host-modules-arch
vlc
zathura
)

appearance=(
arc-gtk-theme
arc-icon-theme
capitaine-cursors
papirus-icon-theme
)

clear
sudo pacman -S --needed --noconfirm git curl &>/dev/null
clear
echo "Instalación del entorno: Qtile"
echo "-----------------------------------------------------"

echo ""
echo "Instalando: ..."

# AUR Helper
cd $HOME
git clone https://aur.archlinux.org/yay.git &>/dev/null
cd yay
makepkg -sirc --noconfirm &>/dev/null
cd $HOME
rm -rf yay
echo "    $(tput setaf 2)+ $(tput sgr0)Instalador de paquetes YAY"

pacman -S --needed --noconfirm ${video[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Drivers de video"
pacman -S --needed --noconfirm ${audio[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Drivers de audio"
pacman -S --needed --noconfirm ${dewm[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Window manager y paquetes necesarios"
pacman -S --needed --noconfirm ${fonts[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Fuentes necesarias"
pacman -S --needed --noconfirm ${console[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Utilidades para la terminal"
pacman -S --needed --noconfirm ${files[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Utilidades para el manejo de archivos"
pacman -S --needed --noconfirm ${utilities[@]} &>/dev/null
yay -S --noconfirm figma-linux &>/dev/null
yay -S --noconfirm spotify &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Otros paquetes"
pacman -S --needed --noconfirm ${appearance[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Utilidades para la apariencia"

sudo systemctl enable lightdm &>/dev/null
rm -rf ~/Downloads/yay
sudo modprobe vboxdrv
echo "    $(tput setaf 2)+ $(tput sgr0)Configuraciones finales"

echo ""
echo "El sistema esta casi listo, ahora necesitamos los dotfiles"

# Git config
git config --global user.name yesiddev
git config --global user.email yesiddgarzon@gmail.com
git config --global color.ui true
git config --global core.editor nvim
git config --global init.defaultBranch main

# Clone dotfiles
cd $HOME
mkdir .dotfiles
git clone --bare https://github.com/yesiddev/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

echo ""
echo "$(tput setaf 2)El sistema ha sido instalado con éxito"
read -p "$(tput sgr0)Presiona Enter para salir y reinicia"
}
