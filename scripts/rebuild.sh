#!/usr/bin/env bash

git config core.pager cat

echo -n "Rebuilding..."
cd $HOME/dotfiles
if [[ -n $1 && $1 == "--update" ]] then
nix-channel --update
cd ./nix
nix flake update
cd $HOME/dotfiles
fi
current=$(nixos-rebuild list-generations | grep current)
git diff HEAD --minimal
if [[ -z $2 && $1 != "--y" ]] then
echo "Rebuild & commit with this diff? [Y/n] "
read -n 1 confirm
echo ""
fi
if [[ $confirm != "n" ]] then
git add .
git commit -am "$current"
sudo nixos-rebuild switch --flake $HOME/dotfiles/nix#$HOSTNAME
fi
