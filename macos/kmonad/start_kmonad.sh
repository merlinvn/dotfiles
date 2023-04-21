#!/bin/bash

# Define the process name to check
process_name="kmonad"

# Check if the process is already running
if pgrep "$process_name" >/dev/null; then
  echo "$process_name is already running. Exiting..."
  exit 1
fi

sudo /Users/neo/.local/bin/kmonad /Users/neo/dotfiles/macos/kmonad/config.kbd &> /tmp/kmonad.log &
