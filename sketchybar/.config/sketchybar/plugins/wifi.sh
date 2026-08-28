#!/usr/bin/env bash

interface=$(route get default 2>/dev/null | awk '/interface:/{print $2; exit}')
[ -z "$interface" ] && {
  sketchybar --set "$NAME" icon="" label="Offline"
  exit 0
}

# `ipconfig getsummary` redacts the SSID on newer macOS versions. Use
# networksetup for the user-visible network name instead.
airport=$(networksetup -getairportnetwork "$interface" 2>/dev/null)
ssid=${airport#*: }
[ "$ssid" = "$airport" ] && ssid=""
[ "$ssid" = "<redacted>" ] && ssid=""
wifi_connected=$(system_profiler SPAirPortDataType 2>/dev/null | awk '/Status: Connected/ {print "1"; exit}')

if [ -n "$ssid" ]; then
  # Font Awesome's Wi-Fi glyph is included in Hack Nerd Font and avoids the
  # missing-glyph issue seen with the MDI glyphs previously used here.
  icon=""
  sketchybar --set "$NAME" icon="$icon" label="$ssid"
else
  label="Offline"
  [ "$wifi_connected" = "1" ] && label="$interface"
  sketchybar --set "$NAME" icon="" label="$label"
fi
