#!/bin/bash

DOTFILES_DIR=~/dotfiles

#INSTALLING
sudo pacman -S --needed --noconfirm hyprland hyprpaper hyprlock hypridle kitty alacritty firefox git zsh nautilus neovim wl-clipboard

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git /yay
    cd /yay
    makepkg -si --noconfirm
    cd -
fi

yay -S --needed --noconfirm nwg-look wlogout github-cli

#CONFIG
cp -r $DOTFILES_DIR/config/hypr ~/.config/
cp $DOTFILES_DIR/.zshrc ~/
cp -r $DOTFILES_DIR/config/kitty ~/.config/
cp -r $DOTFILES_DIR/config/yay ~/.config/
cp -r $DOTFILES_DIR/config/nvim ~/.config/
cp -r $DOTFILES_DIR/config/wlogout ~/.config/
cp -r $DOTFILES_DIR/config/ohmyposh ~/.config/
cp -r $DOTFILES_DIR/config/alacritty ~/.config/
cp -r $DOTFILES_DIR/config/Kvantum ~/.config/
cp -r $DOTFILES_DIR/config/qt6ct ~/.config/
cp -r $DOTFILES_DIR/config/gtk-3.0 ~/.config/
cp -r $DOTFILES_DIR/config/nwg-look ~/.config/
cp -r $DOTFILES_DIR/yay ~/

#LOCAL
cp -r $DOTFILES_DIR/local/share/fonts ~/.local/share/fonts/
cp -r $DOTFILES_DIR/local/share/themes ~/.local/share/themes/

cp -r $DOTFILES_DIR/local/share/themes /usr/share/themes/

#PICTURES
if [[ ! -d ~/Pictures ]]; then
    mkdir -p ~/Pictures
fi
cp -r $DOTFILES_DIR/pictures ~/Pictures/

#AUTOLOGIN
sudo cp $DOTFILES_DIR/autologin/autologin-first-user /usr/local/bin/
sudo chmod +x /usr/local/bin/autologin-first-user

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo cp $DOTFILES_DIR/autologin/autologin.conf /etc/systemd/system/getty@tty1.service.d/

sudo systemctl daemon-reload

cp $DOTFILES_DIR/autologin/.bash_profile ~/


echo "completed"
