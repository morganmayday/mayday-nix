#!/usr/bin/env bash

echo -n "Rebuilding..."
cd $HOME/dotfiles
if [[ -n $1 && $1 == "--update" ]] then
nix-channel --update
nix flake update
fi
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --flake $HOME/dotfiles/nix#$HOSTNAME
