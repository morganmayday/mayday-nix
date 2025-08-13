#!/usr/bin/env bash

nix-channel --update
cd $HOME/dotfiles
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --upgrade --flake $HOME/dotfiles/nix#atlas
reboot
