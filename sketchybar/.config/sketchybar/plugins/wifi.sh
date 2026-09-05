#!/usr/bin/env bash

NAME="${NAME:-wifi}"

INTERFACE="$(
  /sbin/route -n get default 2>/dev/null |
    awk '/interface:/ { print $2; exit }'
)"

if [ -z "$INTERFACE" ]; then
  sketchybar --set "$NAME" \
    icon="󰖪" \
    label="Offline"
  exit 0
fi

HARDWARE_PORT="$(
  /usr/sbin/networksetup -listallhardwareports |
    awk -v device="$INTERFACE" '
      /^Hardware Port:/ {
        port = $0
        sub(/^Hardware Port: /, "", port)
      }

      /^Device:/ && $2 == device {
        print port
        exit
      }
    '
)"

case "$HARDWARE_PORT" in
Wi-Fi | AirPort)
  SSID="$(
    /usr/sbin/ipconfig getsummary "$INTERFACE" 2>/dev/null |
      awk -F ' : ' '
          /^[[:space:]]*SSID[[:space:]]*:/ {
            print $2
            exit
          }
        '
  )"

  case "$SSID" in
  "" | "<redacted>")
    SSID="Wi-Fi"
    ;;
  esac

  sketchybar --set "$NAME" \
    icon="" \
    label="$SSID"
  ;;

*Ethernet* | *LAN* | *Thunderbolt*)
  sketchybar --set "$NAME" \
    icon="󰈀" \
    label="LAN"
  ;;

*)
  sketchybar --set "$NAME" \
    icon="󰈀" \
    label="${HARDWARE_PORT:-$INTERFACE}"
  ;;
esac
