#!/bin/bash
printf "%.0f" "$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits)"
