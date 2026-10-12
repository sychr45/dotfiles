#!/bin/bash
printf "%.0f" "$(rocm-smi --showpower --csv | tail -1 | cut -d',' -f2)"
