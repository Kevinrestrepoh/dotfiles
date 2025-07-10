chosen=$(echo -e " ⏻ \t \t " | rofi -dmenu -config ~/.config/rofi/powermenu.rasi -sep "\t" | xargs)

case "$chosen" in
    "⏻") systemctl poweroff ;;
    "") systemctl reboot ;;
    "") systemctl suspend ;;
    *) exit 1 ;;
esac
