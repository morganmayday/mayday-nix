# Variables are placeholders from primary machine
{ inputs, config, osConfig, pkgs, framework-12-13th-gen-intel, ... }: 

let
username = "mayday"; # update here and it will update your username in the rest of this file
machinename = "atlas"; # update here and it will update your machinename in the rest of this file
in
{
  
  system.nixos.label = "${machinename}";
  networking.hostName = "${machinename}";

  imports =
    [ # Include the results of the hardware scan
      ./hw-cfg-${machinename}.nix
    ];
}
