OPTION=$(echo -e "Themes\nWallpapers" | rofi -dmenu -theme ~/.config/rofi/theme-selector.rasi -p "Seleccionar:")

if [ -z "$OPTION" ]; then
    exit 0
fi

case $OPTION in
    "Themes")
        THEME=$(ls ~/.config/themes | rofi -dmenu -theme ~/.config/rofi/theme-selector.rasi -p "Temas:")
        if [ -n "$THEME" ]; then
            ~/.config/scripts/change-theme.sh "$THEME"
        fi
        ;;
    "Wallpapers")
        WALLPAPER=$(
            find ~/Pictures/wallpapers -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
                echo -en "$img\x00icon\x1f$img\n"
            done | rofi -dmenu -show-icons -theme ~/.config/rofi/wallpaper-selector.rasi -selected-row 0
        )

        if [ -n "$WALLPAPER" ]; then
            killall hyprpaper 2>/dev/null
            echo "preload = $WALLPAPER" > ~/.config/hypr/hyprpaper.conf
            echo "wallpaper = ,$WALLPAPER" >> ~/.config/hypr/hyprpaper.conf
            hyprpaper &
        fi
        ;;
esac
