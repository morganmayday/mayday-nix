# File loaded for a Hyprland DE.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland # hyprland
    # kitty # hyprland default terminal
    mako # notif tool
    hyprland-qt-support
    hyprpolkitagent # polkit gui agent
    waybar # hyprland bar
    wofi
    swww
    iio-hyprland
    iio-sensor-proxy
  ];
programs.hyprland.enable = true;
environment.sessionVariables.NIXOS_OZONE_WL = "1"; # fixes some electron stuff
}
