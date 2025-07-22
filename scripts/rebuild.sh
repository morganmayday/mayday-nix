#!/usr/bin/env bash
# Notes:
# 'mayday-nix' should be your config directory, rename as necessary
# 'mayday' in the path should be your username
# lot of this shamelessly stolen from https://github.com/taiwithers/NixOS-Config/blob/e85ead76e3057026eb194a5dae2028b22b4db5d3/rebuild.sh

cd /home/mayday/mayday-nix
git add .
git status
git diff -U0 '*.nix'
git commit -am "Committing..."
sudo nixos-rebuild switch --flake /home/mayday/mayday-nix
