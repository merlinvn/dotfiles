#!/bin/bash

# Define the paths
KANATA_BIN="$HOME/.dotfiles/kanata/kanata"
SUDOERS_FILE="/private/etc/sudoers.d/kanata"

# Ensure the file exists
if [[ ! -f "$KANATA_BIN" ]]; then
  echo "Error: Kanata binary not found at $KANATA_BIN"
  exit 1
fi

if [[ ! -f "$SUDOERS_FILE" ]]; then
  echo "Error: Sudoers file not found at $SUDOERS_FILE"
  exit 1
fi

# Calculate new SHA256
NEW_SHA=$(shasum -a 256 "$KANATA_BIN" | awk '{print $1}')

# Update the sudoers file with the new SHA
sudo sed -i '' "s/sha256:[a-f0-9]\{64\}/sha256:$NEW_SHA/" "$SUDOERS_FILE"

echo "Updated SHA256 in $SUDOERS_FILE"
