#!/usr/bin/env bash

packages = (
base-devel 
bluedevil
bluez 
bluez-utils 
dosfstools 
efibootmgr 
grub 
mtools 
nano 
networkmanager 
network-manager-applet
ntfs-3g 
openssh
os-prober 
reflector 
sudo 
ufw 
zsh 
)

echo "Esto restablecerá el sistema a la instalación básica de Arch. Solo"
echo "tendrás el sistema base, deberás instalar de nuevo tu WM o DE u otro"
echo "diferente."
echo ""
echo "¿Seguro deseas continuar?"
read -p "Presiona Enter para continuar o Ctrl+c para salir..."
echo ""
echo "Buena Suerte"
sudo pacman -D --asdeps $(pacman -Qqe)
sudo pacman -D --asexplicit ${packages[@]}
su - << EOF 
pacman -Qttdq | pacman -Rns -
EOF

echo ""
echo "Está hecho. Ahora puedes reiniciar y verificar que todo esté en orden"
