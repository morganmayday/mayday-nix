#!/usr/bin/env bash

directory="mayday-nix/eou" # NOTE: change directory as appropriate

cd
if [[ -s ~/.bashrc ]] then
echo -n "File exists. Overwrite? [y/n]: "
read -n 1 verify
if [[ -s ~/.bashrc && $verify != "n" ]] then
truncate -s 0 ~/.bashrc
cd $directory
scripts=`ls *.sh`
cd
for eachfile in $scripts
do
   echo "alias ${eachfile%.sh} $eachfile" >> ~/.bashrc
done
echo "Written. Restart shell to see changes."
else
echo "Declined, aborting."
fi
else
cd $directory
scripts=`ls *.sh`
cd
for eachfile in $scripts
do
   echo "alias ${eachfile%.sh} $eachfile" >> ~/.bashrc
done
echo "Written. Restart shell to see changes."
fi
