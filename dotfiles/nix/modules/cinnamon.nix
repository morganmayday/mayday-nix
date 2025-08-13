# File loaded for a Cinnamon DE.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cinnamon-common # Cinnamon desktop environment
    kdePackages.kate # text editor
  ];
services.xserver.desktopManager.cinnamon.enable = true;
}
