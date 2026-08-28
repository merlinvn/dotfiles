#!/usr/bin/env bash

PERCENTAGE="$(pmset -g batt | grep -Eo '[0-9]+%' | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=""
  ;;
  [6-8][0-9]) ICON=""
  ;;
  [3-5][0-9]) ICON=""
  ;;
  [1-2][0-9]) ICON=""
  ;;
  *) ICON=""
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="󰂄"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
COLOR=0xFFE6EAF2
[ "$PERCENTAGE" -le 20 ] && COLOR=0xFFED8796
[ "$PERCENTAGE" -le 10 ] && COLOR=0xFFFF0000
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" label.color="$COLOR"
