#!/usr/bin/env bash
# ~/.config/waybar/intel_power.sh

STATE="/tmp/waybar_intel_gpu_power.state"

for hw in /sys/class/drm/card0/device/hwmon/hwmon*; do
    [ -d "$hw" ] || continue

    # Preferred: direct power sensor (microwatts)
    if [ -r "$hw/power1_input" ]; then
        raw=$(<"$hw/power1_input")
        awk -v uw="$raw" 'BEGIN { printf "%d\n", int(uw / 1000000 + 0.5) }'
        exit 0
    fi
    if [ -r "$hw/power1_average" ]; then
        raw=$(<"$hw/power1_average")
        awk -v uw="$raw" 'BEGIN { printf "%d\n", int(uw / 1000000 + 0.5) }'
        exit 0
    fi

    # Fallback: cumulative energy counter (microjoules)
    if [ -r "$hw/energy1_input" ]; then
        now_energy=$(<"$hw/energy1_input")
        now_time=$(date +%s%N)

        if [ -f "$STATE" ]; then
            read -r prev_energy prev_time < "$STATE"
            dt=$(( now_time - prev_time ))
            de=$(( now_energy - prev_energy ))

            if [ "$dt" -gt 0 ] && [ "$de" -ge 0 ]; then
                # W = Δenergy(µJ) × 1000 / Δt(ns)
                awk -v de="$de" -v dt="$dt" 'BEGIN { printf "%d\n", int((de * 1000) / dt + 0.5) }'
                echo "$now_energy $now_time" > "$STATE"
                exit 0
            fi
        fi

        # First run or counter reset → store and stay silent for one tick
        echo "$now_energy $now_time" > "$STATE"
        exit 0
    fi
done

exit 0
