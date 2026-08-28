#!/usr/bin/env bash

pagesize=$(sysctl -n hw.pagesize)
stats=$(vm_stat)
free=$(awk '/Pages free/ {gsub("\\.", "", $3); print $3} /Pages inactive/ {gsub("\\.", "", $3); print $3}' <<< "$stats" | awk '{sum += $1} END {print sum}')
total=$(sysctl -n hw.memsize)

if [ -n "$total" ] && [ -n "$free" ] && [ "$total" -gt 0 ]; then
  used=$((total - free * pagesize))
  percent=$((used * 100 / total))
else
  percent=$(memory_pressure -Q 2>/dev/null | awk -F'[:%]' '/free percentage/ {gsub(/ /, "", $2); print 100 - $2; exit}')
fi
[ -z "$percent" ] && percent=0

color=0xFFE6EAF2
[ "$percent" -ge 75 ] && color=0xFFEED49F
[ "$percent" -ge 90 ] && color=0xFFED8796
sketchybar --set "$NAME" label="${percent}%" label.color="$color"
