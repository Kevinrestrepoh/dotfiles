if pgrep -f 'blueman-manager' > /dev/null; then
    pkill -f 'blueman-manager'
fi

if pgrep -f 'networkui' > /dev/null; then
    pkill -f 'networkui'
fi

if pgrep -f 'kitty.*--class=calendar' > /dev/null; then
    pkill -f 'kitty.*--class=calendar'
fi

if pgrep -f 'pavucontrol' > /dev/null; then
    pkill -f 'pavucontrol'
    exit
fi

pavucontrol
