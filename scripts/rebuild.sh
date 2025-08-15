#!/usr/bin/env bash

echo -n "Rebuilding..."
cd $HOME/dotfiles
if [[ -n $1 && $1 == "--update" ]] then
nix-channel --update
nix flake update
fi
current=$(nixos-rebuild list-generations | grep current)
git diff 
if [[ -z $2 && $1 != "--y" ]] then
echo -n "Rebuild & commit with this diff? [Y/n]"
read -n confirm
fi
if [[ $confirm != "n" ]]
git add .
git commit -am "$current"
sudo nixos-rebuild switch --flake $HOME/dotfiles/nix#$HOSTNAME
fi
