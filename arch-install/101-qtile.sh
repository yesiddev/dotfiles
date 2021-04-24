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
pacman-contrib
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
zsh-syntax-highlighting
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
sudo systemctl start reflector
sudo pacman -Sy --needed --noconfirm git curl &>/dev/null
clear
echo "Instalación del entorno: qtile"
echo "-----------------------------------------------------"

echo ""
echo "Instalando: ..."

# AUR Helper
cd $HOME
git clone https://aur.archlinux.org/yay.git &>/dev/null
cd yay
makepkg -sirc --noconfirm &>/dev/null
cd $HOME
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] AUR Helper: YAY"

sudo pacman -S --needed --noconfirm ${video[@]} &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Drivers de video"
sudo pacman -S --needed --noconfirm ${audio[@]} &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Drivers de audio"
sudo pacman -S --needed --noconfirm ${dewm[@]} &>/dev/null
yay -Sy --noconfirm polybar &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Window manager y paquetes necesarios"
sudo pacman -S --needed --noconfirm ${fonts[@]} &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Fuentes necesarias"
sudo pacman -S --needed --noconfirm ${console[@]} &>/dev/null
yay -Sy --noconfirm spaceship-prompt-git &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Utilidades para la terminal"
sudo pacman -S --needed --noconfirm ${files[@]} &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Utilidades para el manejo de archivos"
sudo pacman -S --needed --noconfirm ${utilities[@]} &>/dev/null
yay -Sy --noconfirm figma-linux &>/dev/null
yay -Sy --noconfirm spotify &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Utilidades de oficina y entretenimiento"
sudo pacman -S --needed --noconfirm ${appearance[@]} &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Utilidades para la apariencia"

echo ""
echo "Configurando: ..."
sudo systemctl enable lightdm &>/dev/null
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Lightdm inicializado"

# Git config
git config --global user.name yesiddev
git config --global user.email yesiddgarzon@gmail.com
git config --global color.ui true
git config --global core.editor nvim
git config --global init.defaultBranch main
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Git configurado"

rm -rf ~/yay
sudo modprobe vboxdrv
echo "  [$(tput setaf 2)$(tput bold)+$(tput sgr0)] Configuraciones finales"

echo ""
echo "$(tput setaf 2)El sistema ha sido instalado con éxito"
echo ""
echo "$(tput sgr0)Ahora puedes instalar otro entorno o instalar los dotfiles"
read -p "$(tput sgr0)Presiona Enter para salir"
}
