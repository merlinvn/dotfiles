#!/usr/bin/env bash

usage=$(top -l 1 -n 0 2>/dev/null | awk '/CPU usage/ {gsub("%", "", $3); print int($3 + $5); exit}')

# Fallback for systems where top is unavailable to the SketchyBar process.
if [ -z "$usage" ]; then
  usage=$(ps -A -o %cpu= 2>/dev/null | awk '{sum += $1} END {print int(sum + 0.5)}')
fi
[ -z "$usage" ] && usage=0

color=0xFFE6EAF2
[ "$usage" -ge 70 ] && color=0xFFEED49F
[ "$usage" -ge 90 ] && color=0xFFED8796
sketchybar --set "$NAME" label="${usage}%" label.color="$color"
