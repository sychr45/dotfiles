#!/usr/bin/env bash

BASE="$HOME/.config/waybar"

hide() {
    echo "gpu_power: hide ($1)" >&2
    echo '{"text": "", "class": "hidden"}'
    exit 0
}

# Pick the first DRM card that has a PCI device/vendor node
CARD=""
for c in /sys/class/drm/card[0-9]*; do
    if [ -r "$c/device/vendor" ]; then CARD="$c"; break; fi
done
[ -n "$CARD" ] || hide "no DRM card with device/vendor"

vendor=$(<"$CARD/device/vendor")
echo "gpu_power: card=$CARD vendor=$vendor" >&2

case "$vendor" in
    0x10de) script="$BASE/nvidia_power.sh" ;;
    0x1002) script="$BASE/amd_power.sh"    ;;
    0x8086)
        dev_path=$(readlink -f "$CARD/device" 2>/dev/null)
        [[ "$dev_path" == *":00:02.0" ]] && hide "Intel iGPU"
        script="$BASE/intel_power.sh"
        ;;
    *) hide "unknown vendor $vendor" ;;
esac

[ -x "$script" ] || hide "not executable: $script"

raw=$("$script")
rc=$?
[ "$rc" -ne 0 ] && hide "$script exited $rc"

raw="${raw//$'\r'/}"
raw="${raw#"${raw%%[![:space:]]*}"}"
raw="${raw%"${raw##*[![:space:]]}"}"
echo "gpu_power: raw='$raw'" >&2

[[ -z "$raw" ]] && hide "empty output"
[[ "$raw" =~ ^[0-9]+([.][0-9]+)?$ ]] || hide "non-numeric: '$raw'"

watts=$(awk -v v="$raw" 'BEGIN { printf "%d", int(v + 0.5) }')
echo "gpu_power: watts=$watts" >&2

echo "{\"text\": \"${watts}\", \"class\": \"visible\"}"
