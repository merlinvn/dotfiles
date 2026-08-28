#!/usr/bin/env bash

interface=$(route get default 2>/dev/null | awk '/interface:/{print $2; exit}')
[ -z "$interface" ] && exit 0

summary=$(ipconfig getsummary "$interface" 2>/dev/null)
ssid=$(awk -F' : ' '/ SSID :/ {print $2; exit}' <<< "$summary")
rssi=$(awk -F' : ' '/ agrCtlRSSI :/ {print $2; exit}' <<< "$summary")

if [ -n "$ssid" ]; then
  icon="󰤨"
  [ "${rssi#-}" -ge 70 ] 2>/dev/null && icon="󰤟"
  [ "${rssi#-}" -ge 80 ] 2>/dev/null && icon="󰤯"
  sketchybar --set "$NAME" icon="$icon" label="$ssid"
else
  sketchybar --set "$NAME" icon=󰈀 label="$interface"
fi
