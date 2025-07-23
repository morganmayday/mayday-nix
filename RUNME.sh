#!/usr/bin/env bash

function editFile {
    ed -s ,s/mayday/$username/g\wq $1
    ed -s ,s/medea/$hostname/g\wq $1
}

homeDir=${0%/*}
echo -n "Desired username (eg, mayday): "
read -n username
echo -n "Desired hostname (eg, medea): "
read -n hostname

cd $homeDir
editFile "configuration.nix"
editFile "flake.nix"
cd machines
editFile "medea.nix"
mv medea.nix $hostname.nix
cd
cd $homeDir
mv hardware-configuration.nix machines/hw-cfg-$hostname.nix
cd eou
editFile "rebuild.sh"
editFile "script-map.sh"
editFile "update.sh"
