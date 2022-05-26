#!/bin/bash
pacman -S bspwm tilix rofi sxhkd pcmanfm lightdm lightdm-gtk-greeter neofetch htop gvfs leafpad picom nitrogen lxappearance arandr neovim gnome-calculator lsd bat vlc pulseaudio pulseaudio-alsa pavucontrol gpicview evince network-manager-applet firefox base-devel --noconfirm
clear
cp -r .config/bspwm ~/.config
cp -r .config/sxhkd ~/.config
cp .xprofile ~/
cd /opt
git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $USER:$USER ./yay-git
cd yay-git/
makepkg -si
sudo systemctl enable lightdm
echo "==========="
echo "Terminado"
echo "==========="



 

