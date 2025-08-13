# note: need to see if i can variable this right below this message
{ inputs, config, osConfig, pkgs, framework-12-13th-gen-intel, ... }: 

let
  vars = import ./variables.nix
in
{
  username = vars.username;
  hostname = vars.hostname;
  hardware = vars.hardware;

  system.nixos.label = "${hostname}";
  networking.hostName = "${hostname}";

  imports =
    [ # Include the results of the hardware scan
      /etc/nixos/hardware-configuration.nix
    ];
}
