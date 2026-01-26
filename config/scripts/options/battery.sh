options="󱤷  Power Saver\n󰂀  Balanced\n󰍹  Performance"

choice=$(echo -e "$options" | rofi -dmenu -config ~/.config/rofi/options/battery.rasi)

case "$choice" in
    *Power*)
        powerprofilesctl set power-saver
        ;;
    *Balanced*)
        powerprofilesctl set balanced
        ;;
    *Performance*)
        powerprofilesctl set performance
        ;;
esac
