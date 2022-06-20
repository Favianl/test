#!/bin/bash
nvm install v16.15.1
sleep 3
nvm install v18.3.0
sleep 3
nvm use v16.15.1 
sudo pacman -S npm --noconfirm
sudo npm install -g prettier live-server
yay -S brave-bin --noconfirm
nvim +PackerSync
