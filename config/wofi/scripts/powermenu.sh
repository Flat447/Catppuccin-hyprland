#!/bin/bash

# Configurable power menu

# Customize these commands for your system
SHUTDOWN_CMD="systemctl poweroff"
REBOOT_CMD="systemctl reboot"
SUSPEND_CMD="systemctl suspend"
LOCK_CMD="hyprlock"
LOGOUT_CMD="hyprctl dispatch exit"


show_menu() {
    cat << EOF




󰈆
EOF
}

get_selection() {
    show_menu | wofi --dmenu -I --height=1000 --lines=6 --xoffset=970 --yoffset=671 --columns=1 --width=400 --style ~/.config/wofi/style_catppuccin.css
}

execute_action() {
    case "$1" in
        "") $SHUTDOWN_CMD ;;
        "") $REBOOT_CMD ;;
        "") $SUSPEND_CMD ;;
        "") $LOCK_CMD ;;
        "󰈆") $LOGOUT_CMD ;;
        *) exit 0 ;;
    esac
}

SELECTION=$(get_selection)
[[ -n "$SELECTION" ]] && execute_action "$SELECTION"
