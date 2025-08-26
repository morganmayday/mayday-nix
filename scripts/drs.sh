#!/usr/bin/env bash
git remote update
changes=$(git status -s -uno --ahead-behind)
if [[ -z "$changes" ]]; then
echo "No changes to pull. Pushing."
bash $HOME/dotfiles/scripts/drpush.sh
fi
# drpush
# drpull
