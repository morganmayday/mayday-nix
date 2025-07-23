# Variables are placeholders from primary machine
{ inputs, config, osConfig, pkgs, hp-laptop-14s-dq2024nf, ... }: 

let
username = "mayday"; # update here and it will update your username in the rest of this file
machinename = "medea"; # update here and it will update your machinename in the rest of this file
in
{
  
  system.nixos.label = "${machinename}";
  networking.hostName = "${machinename}";

  imports =
    [ # Include the results of the hardware scan
      ./hw-cfg-${machinename}.nix
    ];
}
