#!/usr/bin/env bash

cd $HOME/dotfiles
nix-channel --update
current=$(nixos-rebuild list-generations | grep current)
git add .
git status
git commit -am "$current"
sudo nixos-rebuild switch --upgrade --flake $HOME/dotfiles/nix#atlas
