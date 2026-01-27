options="󰏘  Theme\n󰋩  Wallpaper\n󰍹  Monitor\n󰁹  Battery"

choice=$(echo -e "$options" | rofi -dmenu -config ~/.config/rofi/options.rasi)

case "$choice" in
    *Monitor*)
        ~/.config/scripts/options/monitor.sh
        ;;
    *Battery*)
        ~/.config/scripts/options/battery.sh
        ;;
    *Theme*)
        THEME=$(ls ~/.config/themes | rofi -dmenu -config ~/.config/rofi/options/theme-selector.rasi)
        if [ -n "$THEME" ]; then
            ~/.config/scripts/change-theme.sh "$THEME"
        fi
        ;;
    *Wallpaper*)
        WALLPAPER=$(
            while IFS= read -r img; do
                echo -en "$(basename "$img")\x00icon\x1f$img\n"
            done < <(find ~/Pictures/wallpapers -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \)) | 
            rofi -dmenu -show-icons -config ~/.config/rofi/options/wallpaper-selector.rasi -selected-row 0
        )

        if [ -n "$WALLPAPER" ]; then
            FULL_PATH=$(find ~/Pictures/wallpapers -name "$WALLPAPER" -print -quit)
            if [ -n "$FULL_PATH" ]; then
                killall hyprpaper 2>/dev/null
                cat > ~/.config/hypr/hyprpaper.conf <<EOF
splash = false

wallpaper {
    monitor = eDP-1
    path = $FULL_PATH
  }
EOF
                hyprpaper &

                HYPRLOCK_CONF=~/.config/hypr/hyprlock.conf
                TMP_FILE=$(mktemp)
                awk -v wallpaper="$FULL_PATH" '
                    /^background {/ {in_background=1}
                    in_background && /path = / {
                        print "    path = " wallpaper
                        next
                    }
                    in_background && /}/ {in_background=0}
                    {print}
                ' "$HYPRLOCK_CONF" > "$TMP_FILE"
                mv "$TMP_FILE" "$HYPRLOCK_CONF"
            fi
        fi
        ;;
esac
