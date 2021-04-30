#!/usr/bin/env bash
{
sudo dnf update -y
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo rpm --import https://build.opensuse.org/projects/home:manuelschneid3r/public_key
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_33/home:manuelschneid3r.repo
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf check-update

sudo dnf install -y google-chrome-stable gnome-tweaks vlc code zsh util-linux-user gh discord transmission neovim kitty jetbrains-mono-fonts fira-code-fonts fontawesome-fonts lpf-spotify-client binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon VirtualBox-6.1
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin google-roboto-mono-fonts
sudo dnf groupupdate sound-and-video
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install spotify

/usr/lib/virtualbox/vboxdrv.sh setup
usermod -a -G vboxusers $USER
}
