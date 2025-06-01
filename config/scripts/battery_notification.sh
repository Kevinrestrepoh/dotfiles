battery_file="/sys/class/power_supply/BAT0/capacity"
status_file="/sys/class/power_supply/BAT0/status"
battery_alert="$HOME/.config/scripts/icons/battery-alert.png"
battery_icon="$HOME/.config/scripts/icons/battery.png"

last_notification=0

upower --monitor | while read -r line; do
    battery_percentage=$(cat "$battery_file")
    battery_status=$(cat "$status_file")

    if [ "$battery_status" = "Discharging" ]; then
      if [ "$battery_percentage" -eq 5 ] && [ "$last_notification" != 1 ]; then
          notify-send "Low Battery" "$battery_percentage% of battery remaining" -i "$battery_alert" -t 5000
          last_notification=1
      elif [ "$battery_percentage" -eq 20 ] && [ "$last_notification" != 2 ]; then
          notify-send "Low Battery" "$battery_percentage% of battery remaining" -i "$battery_alert" -t 5000
          last_notification=2
    elif [ "$battery_status" = "Full" ] && [ "$last_notification" != 3 ]; then
        notify-send "Battery Charged" "Battery is fully charged" -i "$battery_icon" -t 5000
        last_notification=3
    fi

    elif [ "$battery_percentage" -gt 20 ] && [ "$battery_percentage" -lt 100 ]; then
        last_notification=0
    fi
done
