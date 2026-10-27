#!/usr/bin/env bash
MIN_TS="/tmp/hypr-minimized-ts"
UNMIN_TS="/tmp/hypr-unminimized-ts"
FADE_MS=500

if [[ -f "$MIN_TS" ]]; then
    printf '{"text": "1 󱂬 Minimised", "class": "show"}\n'
    exit 0
fi

if [[ -f "$UNMIN_TS" ]]; then
    TS=$(cat "$UNMIN_TS" 2>/dev/null)
    NOW=$(date +%s%3N)
    DIFF=$(( NOW - TS ))
    if (( DIFF < FADE_MS )); then
        printf '{"text": "1 󱂬 Minimised", "class": "fade"}\n'
    else
        rm -f "$UNMIN_TS"
        printf '{"text": "", "class": "hidden"}\n'
    fi
    exit 0
fi

printf '{"text": "", "class": "hidden"}\n'
