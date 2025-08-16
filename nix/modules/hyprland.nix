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
    # stuff below for theme
    jq
    socat
    quickshell
    mako
    hyprshot
    kitty
    nwg-look
    hyprpaper
  ];
programs.hyprland.enable = true;
programs.iio-hyprland.enable = true;
environment.sessionVariables.NIXOS_OZONE_WL = "1"; # fixes some electron stuff
}
