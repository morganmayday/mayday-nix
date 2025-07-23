#!/usr/bin/env bash
# Notes:
# This is kinda spaghetti. I'm not Bash-fluent. It should still work tho outside of edge cases

homeDir=$HOME/mayday-nix #you can change this if you so desire but you will also need to manually rename the folder and a lot of specific references to it across the config

function editFile {
    ed -s ,s/mayday/$username/g\wq $1
    ed -s ,s/medea/$hostname/g\wq $1
    ed -s ,s/hp-laptop-14s-dq2024nf/$hardware/g\wq $1
}

nixos-generate-config

echo "Desired username (eg, mayday): "
read username
echo "Desired hostname (eg, medea): "
read hostname
echo "Find your hardware at https://github.com/NixOS/nixos-hardware/blob/master/flake.nix, then paste module name with CTRL + SHIFT + V (eg hp-laptop-14s-dq2024nf): "
read hardware
echo "Change locale from en-US.UTF-8? [y/n]"
echo "If you don't know what this means, leave as is and change later."
read localeChange
echo "Change timezone from US/Pacific? [y/n]"
echo "You can change this later."
read timeChange

editAll
cd $homeDir
editFile "configuration.nix"
editFile "flake.nix"
cd machines
editFile "medea.nix"
mv medea.nix $hostname.nix
cd
cd $homeDir
mv hardware-configuration.nix machines/hw-cfg-$hostname.nix

if [[ $localeChange == y ]] then
echo "Input desired locale."
echo "A list of supported locales can be found at https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/SUPPORTED"
read freshLocale
cd modules
ed -s ,s/en-US.UTF-8/$freshLocale/g\wq services.nix
cd
cd $homeDir
fi
if [[ $timeChange == y]] then
echo "Input desired timezone."
echo "A list of supported timezones can be found at https://en.wikipedia.org/wiki/List_of_tz_database_time_zones"
read freshTime
cd modules
ed -s ,s/US\/Pacific/$freshTime/g\wq services.nix
fi

echo "Mapping scripts to aliases..."
cd
cd $homeDir/eou
bash script-map.sh
echo "Mapping complete."

echo "All has been updated. Setting up Git."
cd
cd $homeDir
echo "Temporarily adding Git via \$PATH variable..."
nix-shell -p git
echo -n "done"
echo "Setting Git username to $username..."
git config --global user.name $username
echo -n "done, you can change this later"
echo "Setting Git email to fake email $username@$hostname.local..."
git config --global user.email $username@$hostname.local
echo -n "done, you can change this later"
echo "Initializing Git repo..."
git init
echo -n "done"
echo "Adding config to repo..."
git add .
echo -n "done"
echo "Committing..."
git commit -am "Mayday Nix v0.1.0 via RUNME.sh"
echo -n "done"
echo "Rebuilding NixOS..."
sudo nixos-rebuild switch --flake $HOME/mayday-nix
echo -n "done"
echo "Rebooting in 5 seconds. Hold on to your hats!"
sleep 5
reboot
