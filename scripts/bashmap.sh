#!/usr/bin/env bash

directory="$HOME/dotfiles/scripts" # NOTE: change directory as appropriate

cd
if [[ -s ~/.bashrc ]] then
echo -n "File exists. Overwrite? [y/N]: "
read -n 1 verify
if [[ -s ~/.bashrc && $verify == "y" ]] then
truncate -s 0 ~/.bashrc
cd $directory
scripts=`ls *.sh`
cd
for eachfile in $scripts
do
   chmod a+xX $directory/$eachfile
   echo "alias ${eachfile%.sh}=\"$directory/$eachfile\"" >> ~/.bashrc
done
echo -e "\nWritten. Restart shell to see changes."
else
echo -e "\nDeclined, opening editor."
$EDITOR ~/.bashrc
fi
else
cd $directory
scripts=`ls *.sh`
cd
for eachfile in $scripts
do
   echo "alias ${eachfile%.sh}=\"$directory/$eachfile\"" >> ~/.bashrc
done
echo -e "\nWritten. Restart shell to see changes."
fi
