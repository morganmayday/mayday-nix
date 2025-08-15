# note: need to see if i can variable this right below this message
{ inputs, config, osConfig, pkgs, variables, framework-12-13th-gen-intel, ... }:

{

  system.nixos.label = "${hostname}";
  networking.hostName = "${hostname}";

  imports =
    [ # Include the results of the hardware scan
      /etc/nixos/hardware-configuration.nix
    ];
}
