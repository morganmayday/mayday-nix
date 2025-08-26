#!/usr/bin/env bash
cd $HOME/dotfiles
git add .
git commit -am "Autocommit"
git remote update
statusr=$(git status --ahead-behind | grep -E "Your branch is" | awk '{print $4}' )
echo "$statusr"
#if [[ $statusr == "up" ]]; then
#    echo "Local and remote already synced."
#elif [[ $statusr == "ahead" ]]; then
#    echo "Ahead of remote, no diverging changes. Pushing now."
#    git push -q
#    echo "Pushed!"
#elif [[ $statusr = ""]]

#changes=$(git status -s -uno)
#untracked=$(git status -s -u)
#echo $statusr1
#echo $changes
#echo $untracked

#if [[ -z "$changes" && -n "$untracked" ]]; then
#    echo "No changes to pull, but untracked files exist. Pushing."
#    bash $HOME/dotfiles/scripts/drpush.sh
#elif [[ -n "$changes" ]]; then
#    echo "bwaa"
#fi
# drpush
# drpull
