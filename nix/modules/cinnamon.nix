# File loaded for a Cinnamon DE. Not loaded in the Hyprland branch.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cinnamon-common # Cinnamon desktop environment
  ];
services.xserver.desktopManager.cinnamon.enable = true;
}
