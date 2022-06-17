#!/bin/bash
nvm install v16.15.1
nvm install v18.3.0
nvm use v16.15.1 
sudo pacman -S npm --noconfirm
sudo npm install -g prettier
yay -S brave-bin --noconfirm
nvim +PackerSync