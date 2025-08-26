#!/usr/bin/env bash
cd $HOME/dotfiles
git add .
git commit -am "Autocommit"
git remote update
statusr=$(git status --ahead-behind | grep -E "Your branch" | awk '{print $4}')

if [[ $statusr == "up" ]]; then
    echo "Local and remote already synced."
elif [[ $statusr == "ahead" ]]; then
    echo "Ahead of remote, no diverging changes. Pushing now."
    git push -q
    echo "Pushed!"
elif [[ $statusr == "behind" ]]; then
    echo "Behind remote, no diverging changes. Pulling now."
    git pull -q
    echo "Pulled!"
elif [[ -n $statusr ]]; then
    echo "Divergent changes detected. Manual intervention required."
fi
