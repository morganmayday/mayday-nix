# Medea (HP laptop)
{ config, pkgs, hp-laptop-14s-dq2024nf, ... }: {
  
  system.nixos.label = "medea";
  networking.hostName = "medea";

  imports =
    [ # Include the results of the hardware scan
      ./hw-cfg-medea.nix
    ];

  home = {
    username = "mayday";
    homeDirectory = "/home/mayday";
  };
}
