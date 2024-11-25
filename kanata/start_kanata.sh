#!/bin/bash

# Define the process name to check
process_name="kanata"

# Check if the process is already running
if pgrep "$process_name" >/dev/null; then
  echo "$process_name is already running. Exiting..."
  exit 1
fi

sudo ~/.dotfiles/kanata/kanata_macos_cmd_allowed_arm64 -c ~/.dotfiles/kanata/config_macos.kbd -q &>/tmp/kanata.log &
