if pgrep -f 'nm-connection-editor' > /dev/null; then
    pkill -f 'nm-connection-editor'
fi

if pgrep -f 'pavucontrol' > /dev/null; then
    pkill -f 'pavucontrol'
fi

if pgrep -f 'blueman-manager' > /dev/null; then
    pkill -f 'blueman-manager'
    exit
fi

blueman-manager
