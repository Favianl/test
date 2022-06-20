#!/bin/bash
sudo pacman -S bspwm tilix rofi sxhkd pcmanfm neofetch htop xf86-video-vesa xf86-video-ati xf86-video-amdgpu vulkan-radeon vulkan-icd-loader xorg-server xorg-xinit xorg-xev xorg mesa mesa-demos gvfs leafpad picom nitrogen lxappearance lxsession arandr neovim gnome-calculator lsd bat vlc pulseaudio pulseaudio-alsa pavucontrol pamixer gpicview evince network-manager-applet zip unzip unrar firefox base-devel yad xdotool ttf-dejavu imagemagick drawing inkscape redshift tree xclip --noconfirm
clear
mkdir ~/.config
mkdir ~/Pictures
cp -r .config/* ~/.config
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
chmod +x ~/.config/polybar/launch.sh
git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si --noconfirm
cd ..
sudo yay -S polybar --noconfirm
sudo pacman -S ttf-roboto-mono python3 python-pip locate stylua --noconfirm 
sudo systemctl enable lightdm
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
sudo localectl set-x11-keymap es
sudo timedatectl set-ntp true
rm ~/.bashrc
cp -r home/. ~/
chmod +x ~/.screenlayout/monitor-acer.sh
chmod +x ~/popup-calendar.sh
#backup config. de tilix
#dconf dump /com/gexperts/Tilix/ > tilix.dconf
dconf load /com/gexperts/Tilix/ < tilix.dconf
yay -S nerd-fonts-mononoki --noconfirm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# reboot
echo "============FIN==============="



 

