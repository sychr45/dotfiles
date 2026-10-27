#!/usr/bin/env bash
# ~/.config/hypr/start-hyprland.sh

driver=$("$HOME/.config/hypr/detect-vaapi.sh")
[ -n "$driver" ] && export LIBVA_DRIVER_NAME="$driver"

exec Hyprland
