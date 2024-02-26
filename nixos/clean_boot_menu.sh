#!/usr/bin/env bash

echo "Clean boot menu"

sudo nix-collect-garbage

sudo nix-collect-garbage -d

./rebuild.sh
