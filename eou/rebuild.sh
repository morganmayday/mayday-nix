#!/usr/bin/env bash
# Notes:
# 'mayday-nix' should be your config directory, rename as necessary

cd $HOME/mayday-nix
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --flake $HOME/mayday-nix &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1) # trying magic code from NoBoilerplate's Nix vid
