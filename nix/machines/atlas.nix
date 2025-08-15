# note: need to see if i can variable this right below this message
{ inputs, config, osConfig, pkgs, variables, framework-12-13th-gen-intel, ... }:

{

  system.nixos.label = "${variables.hostname}";
  networking.hostName = "${variables.hostname}";

  imports =
    [ # Include the results of the hardware scan
      ./hw-config-${variables.hostname}.nix
    ];
}
