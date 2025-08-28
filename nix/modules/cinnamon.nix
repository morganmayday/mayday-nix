# File loaded for a Cinnamon DE. Not loaded in the Hyprland branch.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cinnamon # Cinnamon desktop environment
  ];
services.xserver.desktopManager.cinnamon.enable = true;
services.cinnamon.apps.enable = true;
}
