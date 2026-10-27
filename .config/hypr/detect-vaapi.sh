#!/usr/bin/env bash
# ~/.config/hypr/detect-vaapi.sh

CARD=/sys/class/drm/card0

[ -r "$CARD/device/vendor" ] || exit 0
vendor=$(<"$CARD/device/vendor")

case "$vendor" in
    0x10de) driver="nvidia"   ;;   # NVIDIA
    0x1002) driver="radeonsi" ;;   # AMD
    0x8086) driver="iHD"      ;;   # Intel (modern; swap to i965 if needed)
    *)      exit 0            ;;
esac

echo "$driver"
