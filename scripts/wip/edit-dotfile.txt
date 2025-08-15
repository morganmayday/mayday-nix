#!/usr/bin/env bash
# Notes:
# 'mayday-nix' should be your config directory, rename as necessary
cd $HOME/dotfiles
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --flake $HOME/dotfiles/nix#atlas
