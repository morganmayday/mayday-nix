#!/usr/bin/env bash

cd $HOME/dotfiles
git add .
git commit -am "autocommit to ensure changes grabbed"
git push -q
echo "Pushing!"
