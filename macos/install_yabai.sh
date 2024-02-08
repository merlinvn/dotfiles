#!/bin/bash
#
# Disable SIP
#
# Install yabai
brew install yabai
brew install skhd
#
brew pin yabai
brew pin skhd
# Set sudoers
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa"
#sudo visudo -f /private/etc/sudoers.d/yabai

# fix nvram for mac M3
# sudo nvram boot-args=-arm64e_preview_abi
