#!/usr/bin/env bash
{

packages=(
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

clear
echo "Instalación básica de Arch Linux"
echo "-----------------------------------------------------"

echo "Primero ingresa algunos datos"
read -p "  >>> Nombre del host: " hostname
read -p "  >>> Contraseña del root: " rootpass
read -p "  >>> Nombre de usuario: " username
read -p "  >>> Contraseña del usuario: " userpass 

echo ""
echo "Comenzamos la installación"

# System Clock
timedatectl set-ntp true
echo "    $(tput setaf 2)+ $(tput sgr0)Reloj del sistema actualizado"

# Format and mount Partitions
{
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4

mount /dev/sda3 /mnt
mkdir -p /mnt/{boot/EFI,home}
mount /dev/sda1 /mnt/boot/EFI
mount /dev/sda4 /mnt/home
swapon /dev/sda2
} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Particiones formateadas y montadas"

# Essential Packages
echo ""
echo "Instalando paquetes esenciales"
pacstrap /mnt base linux linux-firmware &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Los paquetes esenciales fueron instalados"

echo ""
echo "Configuración el sistema"
# Fstab
genfstab -U /mnt >> /mnt/etc/fstab
echo "    $(tput setaf 2)+ $(tput sgr0)Fstab generado"

# Chroot
arch-chroot /mnt /bin/bash <<EOF

ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
hwclock --systohc
echo "    $(tput setaf 2)+ $(tput sgr0)Timezone configurado"

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen &>/dev/null
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "    $(tput setaf 2)+ $(tput sgr0)Idioma configurado"

echo $hostname > /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   $hostname.localdomain   $hostname" >> /etc/hosts
echo "    $(tput setaf 2)+ $(tput sgr0)Host/hosts configurados"

echo "root:${rootpass}" | chpasswd
echo "    $(tput setaf 2)+ $(tput sgr0)Contraseña del root configurada"

echo "    > Instalando paquetes necesarios para continuar"
pacman -S --needed --noconfirm ${packages[@]} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Paquetes necesarios instalados"

{
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=Grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg
} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Grub configurado"

useradd -m $username
echo "${username}:$userpass" | chpasswd
usermod -aG wheel,video,audio,storage $username
echo "$username ALL=(ALL) ALL" >> /etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
chsh -s $(which zsh) $username &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Usuario $username creado"

{
systemctl enable NetworkManager
ufw enable
systemctl enable sshd
systemctl enable bluetooth
} &>/dev/null
echo "    $(tput setaf 2)+ $(tput sgr0)Servicios iniciados"

EOF

# Finish
umount -R /mnt &>/dev/null
echo ""
echo "--> ¡Listo! Ahora puedes reiniciar e instalar tu WM o DE preferido"
}
