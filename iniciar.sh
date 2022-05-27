#!/bin/bash
pacman -S bspwm tilix rofi sxhkd pcmanfm lightdm lightdm-gtk-greeter neofetch htop xf86-video-vesa xf86-video-ati xorg-server xorg-xinit mesa mesa-demos --noconfirm
#gvfs leafpad picom nitrogen lxappearance arandr neovim gnome-calculator lsd bat vlc pulseaudio pulseaudio-alsa pavucontrol gpicview evince network-manager-applet firefox base-devel --noconfirm
clear
cp -r .config/bspwm ~/.config
echo "copiando bspwm..."
cp -r .config/sxhkd ~/.config
echo "copiando sxhkd..."
cp -r .config/polybar ~/.config
echo "copiando sxhkd..."
chmod +x ~/.config/polybar/launch.sh
echo "cambiando permiso a launch..."
cp .xprofile ~/
echo "copiando xprofile..."
git clone https://aur.archlinux.org/yay-git.git
echo "clonando yay..."
#sudo chown -R $USER:$USER yay-git
#cd yay-git/
#makepkg -si --noconfirm
#sudo yay -S polybar
sudo systemctl enable lightdm
echo "======Instalando Polybar======="
echo "1 - sudo chown -R $USER:$USER yay-git"
echo "2 - cd yay-git"
echo "3 - makepkg -si"
echo "4 - sudo yay -S polybar"
echo "============FIN==============="



 

