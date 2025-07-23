#!/usr/bin/env bash
# Notes:
# 'mayday-nix' should be your config directory, rename as necessary

nix-channel --update
cd $HOME/mayday-nix
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --upgrade --flake $HOME/mayday-nix
reboot
