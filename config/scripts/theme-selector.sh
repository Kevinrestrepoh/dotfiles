THEME=$(ls ~/.config/themes | rofi -dmenu -no-custom -theme ~/.config/rofi/theme-selector.rasi)

if [ -n "$THEME" ]; then
  ~/.config/scripts/change-theme.sh "$THEME"
fi

if [ -n "$THEME" ]; then
  ~/.config/scripts/change-theme.sh "$THEME"
fi
