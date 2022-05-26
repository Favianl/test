#!/bin/bash
pacman -S bspwm tilix rofi sxhkd pcmanfm lightdm lightdm-gtk-greeter neofetch htop gvfs leafpad picom nitrogen lxappearance arandr neovim gnome-calculator lsd bat vlc pulseaudio pulseaudio-alsa pavucontrol gpicview evince network-manager-applet firefox --noconfirm
cp -r .config/bspwm ~/.config
cp -r .config/sxhkd ~/.config
cp .xprofile ~/
systemctl enable lightdm
systemctl start lightdm
echo "==========="
echo "Terminado"
echo "==========="



 

