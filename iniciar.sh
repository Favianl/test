#!/bin/bash
sudo pacman -S bspwm tilix rofi sxhkd pcmanfm lightdm lightdm-gtk-greeter neofetch htop xf86-video-vesa xf86-video-ati xorg-server xorg-xinit xorg-xev mesa mesa-demos gvfs leafpad picom nitrogen lxappearance arandr neovim gnome-calculator lsd bat vlc pulseaudio pulseaudio-alsa pavucontrol pamixer gpicview evince network-manager-applet zip unzip unrar firefox base-devel yad xdotool ttf-dejavu imagemagick drawing inkscape redshift tree xclip --noconfirm
clear
mkdir ~/.config
mkdir ~/Pictures
cp -r .config/* ~/.config
chmod +x ~/.config/polybar/launch.sh
git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $USER:$USER yay-git
cd yay-git/
makepkg -si --noconfirm
cd ..
sudo yay -S polybar --noconfirm 
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
yay -S nerd-fonts-mononoki brave-bin --noconfirm
sudo pacman -S ttf-roboto-mono python3 python-pip locate stylua --noconfirm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# nvm install v16.15.1
# nvm install v18.3.0
# nvm use v16.15.1 
# sudo pacman -S npm --noconfirm
# sudo npm install -g prettier
echo "============FIN==============="



 

