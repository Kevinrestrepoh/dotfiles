options="󱤷  Power Saver\n󰂀  Balanced\n󰍹  Performance"

current=$(powerprofilesctl get)

case "$current" in
  power-saver)
    options="▶ 󱤷  Power Saver\n󰂀  Balanced\n󰍹  Performance"
    ;;
  balanced)
    options="󱤷  Power Saver\n▶ 󰂀  Balanced\n󰍹  Performance"
    ;;
  performance)
    options="󱤷  Power Saver\n󰂀  Balanced\n▶ 󰍹  Performance"
    ;;
esac

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
