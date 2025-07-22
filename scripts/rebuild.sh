#!/usr/bin/env bash
# Notes:
# 'mayday-nix' should be your config directory, rename as necessary
# 'mayday' in the path should be your username

cd /home/mayday/mayday-nix
current=$(nixos-rebuild list-generations | rg current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --flake /home/mayday/mayday-nix
