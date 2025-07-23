#!/usr/bin/env bash

function editFile {
    ed -s ,s/mayday/$username/g\wq $1
    ed -s ,s/medea/$hostname/g\wq $1
}

echo -n "Desired username (eg, mayday): "
read -n username
echo -n "Desired hostname (eg, medea): "
read -n hostname
homeDir=$HOME/mayday-nix #you can change this if you so desire but you will also need to manually rename the folder and a lot of subfolders

cd $homeDir
editFile "configuration.nix"
editFile "flake.nix"
cd machines
editFile "medea.nix"
mv medea.nix $hostname.nix
cd
cd $homeDir
mv hardware-configuration.nix machines/hw-cfg-$hostname.nix
