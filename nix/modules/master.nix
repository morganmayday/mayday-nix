{ inputs, config, pkgs, ... }:
{
imports =
    [
      ./base.nix
      ./hyprland.nix
      # ./cinnamon.nix
      ./tools.nix
      ./media.nix
      ./net.nix
    ];
}
