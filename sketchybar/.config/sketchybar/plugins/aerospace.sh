#!/usr/bin/env bash

# Refresh every workspace in one controller invocation. This avoids spawning
# one AeroSpace IPC query per workspace item on every focus event.
workspaces=(1 2 3 4 5 6 7 8 9 10 Code Cursor Discord Ebooks Firefox Mail Note Orbstack Perplexity Slack Telegram Video)
for sid in $(aerospace list-workspaces --all 2>/dev/null); do
  case " ${workspaces[*]} " in
    *" $sid "*) ;;
    *) workspaces+=("$sid") ;;
  esac
done

workspace_state="$(aerospace list-workspaces --all \
  --format '%{workspace}|%{workspace-is-focused}' 2>/dev/null)"
current_space="$(awk -F'|' '$2 == "true" {print $1; exit}' <<< "$workspace_state")"
all_windows="$(aerospace list-windows --all --format '%{workspace}|%{app-name}' 2>/dev/null)"

for sid in "${workspaces[@]}"; do
  apps="$(awk -F'|' -v workspace="$sid" '$1 == workspace {print $2}' <<< "$all_windows")"
  always_visible=0
  case "$sid" in
    1|2|3|4|5|6|7|8|9|10) always_visible=1 ;;
  esac

  if [ "$current_space" = "$sid" ]; then
    # Focused workspace: always highlighted, even when empty.
    sketchybar --set "space.$sid" \
      drawing=on \
      background.color=0xFF8AADF4 \
      label.color=0xFF161A24
  elif [ -n "$apps" ]; then
    # Unfocused workspace with apps: medium dim.
    sketchybar --set "space.$sid" \
      drawing=on \
      background.color=0xFF2B3447 \
      label.color=0xFFD1D5DB
  elif [ "$always_visible" -eq 1 ]; then
    # Empty numbered workspace: heavily dim but always visible.
    sketchybar --set "space.$sid" \
      drawing=on \
      background.color=0xFF161A24 \
      label.color=0xFF6B7280
  else
    # Empty inactive named workspace: hidden.
    sketchybar --set "space.$sid" drawing=off
  fi
done
