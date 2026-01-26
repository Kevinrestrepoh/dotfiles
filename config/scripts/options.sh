options="󰍹  Monitor\n󰁹  Battery"

choice=$(echo -e "$options" | rofi -dmenu -config ~/.config/rofi/options.rasi)

case "$choice" in
    *Monitor*)
        ~/.config/scripts/options/monitor.sh
        ;;
    *Battery*)
        ~/.config/scripts/options/battery.sh
        ;;
esac
