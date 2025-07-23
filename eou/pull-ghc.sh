#!/usr/bin/env bash
# Notes:
# 'mayday-nix' should be your config directory, rename as necessary
# Pulls latest github commit

cd $HOME/mayday-nix
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
git pull --no-rebase --commit https://github.com/morganmayday/mayday-nix
sudo nixos-rebuild switch --flake $HOME/mayday-nix
