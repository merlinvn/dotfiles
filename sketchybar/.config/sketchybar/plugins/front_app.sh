#!/usr/bin/env bash

# Group windows by app so the bar stays compact while still showing window count.
# Slots are reused instead of created/destroyed on every focus change.
MAX_APPS=12
workspace=$(aerospace list-workspaces --focused 2>/dev/null | head -1)
[ -z "$workspace" ] && exit 0

focused_window=$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null | head -1)
focused_app=$(aerospace list-windows --focused --format '%{app-name}' 2>/dev/null | head -1)

for slot in $(seq 1 "$MAX_APPS"); do
  sketchybar --set "app.$slot" drawing=off label="" click_script=""
done

slot=1
while IFS='|' read -r app_name window_count window_id; do
  [ -z "$app_name" ] && continue
  [ "$slot" -gt "$MAX_APPS" ] && break

  background=0x99202735
  label_color=0xFFE6EAF2
  if [ "$app_name" = "$focused_app" ]; then
    background=0xFF8AADF4
    label_color=0xFF161A24
  fi

  label="$app_name"
  [ "$window_count" -gt 1 ] && label="$app_name | $window_count"

  sketchybar --set "app.$slot" \
    drawing=on \
    icon=󰣆 \
    icon.color="$label_color" \
    label="$label" \
    label.color="$label_color" \
    background.color="$background" \
    click_script="aerospace focus --window-id $window_id"
  slot=$((slot + 1))
done < <(aerospace list-windows --workspace "$workspace" --format '%{app-name}|%{window-id}' 2>/dev/null | awk -F'|' -v focused="$focused_window" '
  !seen[$1]++ { order[++n] = $1; first[$1] = $2 }
  { count[$1]++; if ($2 == focused) first[$1] = $2 }
  END { for (i = 1; i <= n; i++) print order[i] "|" count[order[i]] "|" first[order[i]] }
')
