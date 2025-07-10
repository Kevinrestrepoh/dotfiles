THEME="$1"
THEME_DIR="$HOME/.config/themes/$THEME"

# Waybar
cp "$THEME_DIR/waybar.css" "$HOME/.config/waybar/style.css"
cp "$THEME_DIR/waybar-config" "$HOME/.config/waybar/config"

# Rofi
cp "$THEME_DIR/config.rasi" "$HOME/.config/rofi/config.rasi"
cp "$THEME_DIR/theme-selector.rasi" "$HOME/.config/rofi/theme-selector.rasi"
cp "$THEME_DIR/powermenu.rasi" "$HOME/.config/rofi/powermenu.rasi"

# Kitty
cp "$THEME_DIR/kitty.conf" "$HOME/.config/kitty/kitty-style.conf"

# Nvim
CHADRC="$HOME/.config/nvim/lua/chadrc.lua"

NVIM_SOCKET=$(ls /run/user/$(id -u)/nvim.*.0 2>/dev/null | head -n 1)

if [ -n "$NVIM_SOCKET" ]; then
  nvim --server "$NVIM_SOCKET" --remote-send \
    ":silent! edit $CHADRC | %s/theme = \".*\"/theme = \"$THEME\"/ | w<CR>"

  sleep 0.1

  nvim --server "$NVIM_SOCKET" --remote-send \
    ":luafile ~/.config/nvim/lua/chadrc.lua<CR>"

  nvim --server "$NVIM_SOCKET" --remote-send \
    ":lua require('base46').load_all_highlights()<CR>"
else
  nvim --headless "$CHADRC" +"%s/theme = \".*\"/theme = \"$THEME\"/" +wq
fi

hyprctl reload
waybar --reload-css
killall -SIGUSR1 kitty
