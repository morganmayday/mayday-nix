#!/usr/bin/env bash
git remote update
statusr=$(git status --ahead-behind | grep -E "Your branch is" | awk '{print $4}' )

if [[ $statusr == "up" ]] then

elif [[ $statusr == "ahead" ]] then

    echo "awawa"
fi

changes=$(git status -s -uno)
untracked=$(git status -s -u)
echo $statusr1
echo $changes
echo $untracked

if [[ -z "$changes" && -n "$untracked" ]]; then
    echo "No changes to pull, but untracked files exist. Pushing."
    bash $HOME/dotfiles/scripts/drpush.sh
elif [[ -n "$changes" ]]; then
    echo "bwaa"
fi
# drpush
# drpull
