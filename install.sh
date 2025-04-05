DOTFILES_DIR=~/dotfiles

#INSTALLING
  #hyprland
sudo pacman -S --needed --noconfirm hyprland hyprpaper hyprlock hypridle pipewire pipewire-pulse waybar wofi
  #apps
sudo pacman -S --needed --noconfirm kitty alacritty firefox git zsh nautilus neovim wl-clipboard btop
  #tools (screenshots, bluetooth, notification, calendar)
sudo pacman -S --needed --noconfirm swappy grim slurp blueman bluez bluez-utils swaync calcurse
  #waybar dependencies
sudo pacman -S --needed --noconfirm network-manager-applet pavucontrol playerctl brightnessctl jq
  #programming languages
sudo pacman -S --needed --noconfirm go
go install golang.org/x/tools/gopls@latest mvdan.cc/gofumpt@latest golang.org/x/tools/cmd/goimports@latest github.com/segmentio/golines@latest


git config --global init.defaultBranch main

sudo systemctl enable --now bluetooth

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si --noconfirm
    cd -
    rm -rf ~/yay
fi

yay -S --needed --noconfirm nwg-look wlogout github-cli oh-my-posh xdg-desktop-portal-hyprland-git hyprpolkitagent light

#CONFIG
cp $DOTFILES_DIR/.zshrc ~/
cp -rf $DOTFILES_DIR/config/hypr ~/.config/
cp -r $DOTFILES_DIR/config/kitty ~/.config/
cp -r $DOTFILES_DIR/config/nvim ~/.config/
cp -r $DOTFILES_DIR/config/wlogout ~/.config/
cp -r $DOTFILES_DIR/config/ohmyposh ~/.config/
cp -r $DOTFILES_DIR/config/alacritty ~/.config/
cp -r $DOTFILES_DIR/config/Kvantum ~/.config/
cp -r $DOTFILES_DIR/config/qt6ct ~/.config/
cp -r $DOTFILES_DIR/config/gtk-3.0 ~/.config/
cp -r $DOTFILES_DIR/config/nwg-look ~/.config/
cp -r $DOTFILES_DIR/config/waybar ~/.config/

chmod +x ~/.config/waybar/scripts/audio.sh
chmod +x ~/.config/waybar/scripts/bluetooth.sh
chmod +x ~/.config/waybar/scripts/wifi.sh

#LOCAL
mkdir -p ~/.local/share

cp -r $DOTFILES_DIR/local/share/fonts ~/.local/share/fonts/
cp -r $DOTFILES_DIR/local/share/themes ~/.local/share/themes/

sudo mkdir -p /usr/share
sudo cp -r $DOTFILES_DIR/local/share/themes /usr/share/themes/

#PICTURES
if [[ ! -d ~/Pictures ]]; then
    mkdir -p ~/Pictures
fi
cp -r $DOTFILES_DIR/pictures/* ~/Pictures/

#AUTOLOGIN
sudo cp $DOTFILES_DIR/autologin/autologin-first-user /usr/local/bin/
sudo chmod +x /usr/local/bin/autologin-first-user

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo cp $DOTFILES_DIR/autologin/autologin.conf /etc/systemd/system/getty@tty1.service.d/

sudo systemctl daemon-reload

cp $DOTFILES_DIR/autologin/.bash_profile ~/

echo "completed"
