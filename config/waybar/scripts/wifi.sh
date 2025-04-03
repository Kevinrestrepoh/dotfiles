if pgrep -f 'blueman-manager' > /dev/null; then
    pkill -f 'blueman-manager'
fi

if pgrep -f 'pavucontrol' > /dev/null; then
    pkill -f 'pavucontrol'
fi

if pgrep -f 'nm-connection-editor' > /dev/null; then
    pkill -f 'nm-connection-editor'
    exit
fi

nm-connection-editor
