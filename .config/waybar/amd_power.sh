#!/usr/bin/env bash
# ~/.config/waybar/amd_power.sh

for hw in /sys/class/drm/card0/device/hwmon/hwmon*; do
    [ -d "$hw" ] || continue

    if [ -r "$hw/power1_input" ]; then
        raw=$(<"$hw/power1_input")
    elif [ -r "$hw/power1_average" ]; then
        raw=$(<"$hw/power1_average")
    else
        continue
    fi

    # amdgpu reports microwatts → convert to watts, round to nearest integer
    # int(v + 0.5) = round-half-up for positive values
    awk -v uw="$raw" 'BEGIN { printf "%d\n", int(uw / 1000000 + 0.5) }'
    exit 0
done

# No readable sensor → empty output, parent hides the module
exit 0
