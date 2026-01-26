THEME="$1"
THEME_DIR="$HOME/.config/themes/$THEME"

# Waybar
cp "$THEME_DIR/waybar.css" "$HOME/.config/waybar/style.css"
cp "$THEME_DIR/waybar-config" "$HOME/.config/waybar/config"

# Rofi
cp "$THEME_DIR/config.rasi" "$HOME/.config/rofi/config.rasi"
cp "$THEME_DIR/theme-selector.rasi" "$HOME/.config/rofi/theme-selector.rasi"
cp "$THEME_DIR/powermenu.rasi" "$HOME/.config/rofi/powermenu.rasi"
cp "$THEME_DIR/wallpaper-selector.rasi" "$HOME/.config/rofi/wallpaper-selector.rasi"
cp "$THEME_DIR/options.rasi" "$HOME/.config/rofi/options.rasi"
cp -r "$THEME_DIR/options" "$HOME/.config/rofi"

# Kitty
cp "$THEME_DIR/kitty.conf" "$HOME/.config/kitty/kitty-style.conf"

# Nvim
CHADRC="$HOME/.config/nvim/lua/chadrc.lua"
nvim --headless "$CHADRC" +"%s/theme = \".*\"/theme = \"$THEME\"/" +wq

hyprctl reload
waybar --reload-css
killall -SIGUSR1 kitty
