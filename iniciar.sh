#!/bin/bash
sudo pacman -S bspwm tilix rofi sxhkd pcmanfm lightdm lightdm-gtk-greeter neofetch htop xf86-video-vesa xf86-video-ati xorg-server xorg-xinit xorg-xev mesa mesa-demos gvfs leafpad picom nitrogen lxappearance arandr neovim gnome-calculator lsd bat vlc pulseaudio pulseaudio-alsa pavucontrol pamixer gpicview evince network-manager-applet zip unzip unrar firefox base-devel yad xdotool ttf-roboto-mono ttf-dejavu imagemagick drawing inkscape redshift tree --noconfirm
clear
#cp .xprofile ~/
#echo "copiando xprofile..."
#echo "Copiando archivos .config..."
#mkdir ~/.themes
#cp -r .themes/* ~/.themes
#echo "Copiando archivos .themes..."
#mkdir ~/.icons
#cp -r .icons/* ~/.icons
#echo "Copiando archivos .icons..."
#mkdir ~/wallpapers
#cp -r wallpapers/* ~/wallpapers
#echo "Copiando archivos wallpapers..."
#mkdir ~/.screenlayout
#cp -r .screenlayout/* ~/.screenlayout
#echo "Copiando archivos .screenlayout..."
#cp .gtkrc-2.0 ~/
#echo "copiando gtkrc..."
#cp -r .config/bspwm ~/.config
#echo "copiando bspwm..."
#cp -r .config/sxhkd ~/.config
#echo "copiando sxhkd..."
#cp -r .config/polybar ~/.config
#echo "copiando polybar..."
mkdir ~/.config
cp -r .config/* ~/.config
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.screenlayout/monitor-acer.sh
echo "cambiando permiso a launch..."
git clone https://aur.archlinux.org/yay-git.git
echo "clonando yay..."
sudo chown -R $USER:$USER yay-git
cd yay-git/
echo "compilando yay"
makepkg -si --noconfirm
echo "volviendo a /test"
cd ..
echo "instalando polybar"
sudo yay -S polybar nerd-fonts-mononoki --noconfirm
sudo yay -S brave-bin --noconfirm
echo "habilitando lightdm (iniciar sesion)"
sudo systemctl enable lightdm
echo "clonando ohmybash..."
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
echo "cambiando idioma teclado..."
sudo localectl set-x11-keymap es
echo "sincronizando hora y fecha..."
sudo timedatectl set-ntp true
rm ~/.bashrc
cp -r home/. ~/
echo "copiando archivos home..."
chmod +x ~/popup-calendar.sh
#echo "backup config. de tilix"
#dconf dump /com/gexperts/Tilix/ > tilix.dconf
dconf load /com/gexperts/Tilix/ < tilix.dconf
echo "copiando config. de tilix..."
echo "============FIN==============="



 

