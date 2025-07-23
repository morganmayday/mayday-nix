#!/usr/bin/env bash

function editFile {
    ed -s ,s/mayday/$username/g\wq $1
    ed -s ,s/medea/$hostname/g\wq $1
    ed -s ,s/hp-laptop-14s-dq2024nf/$hardware/g\wq $1
}

function editAll {
    cd $homeDir
    editFile "configuration.nix"
    editFile "flake.nix"
    cd machines
    editFile "medea.nix"
    mv medea.nix $hostname.nix
    cd
    cd $homeDir
    mv hardware-configuration.nix machines/hw-cfg-$hostname.nix
}

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

if [[ $localeChange == y ]] then
echo "Input desired locale."
echo "A list of supported locales can be found at https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/SUPPORTED"
read freshLocale
cd modules
ed -s ,s/en-US.UTF-8/$freshLocale/g\wq services.nix
fi
if [[ $timeChange == y]] then
echo "Input desired timezone."
echo "A list of supported timezones can be found at
homeDir=$HOME/mayday-nix #you can change this if you so desire but you will also need to manually rename the folder and a lot of subfolders


