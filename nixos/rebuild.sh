#!/usr/bin/env bash

echo "Rebuild nixos"

sudo nixos-rebuild switch --flake .#$HOST
