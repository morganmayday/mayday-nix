# File loaded for a Hyprland DE. Not loaded in the Cinnamon branch.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland # hyprland
    # kitty # hyprland default terminal
    mako # notif tool
    hyprland-qt-support
    hyprpolkitagent # polkit gui agent
    waybar # hyprland bar3
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
	upower
    foot
    fzf
    grim
    chafa
    jq
  ];
programs.hyprland.enable = true;
programs.iio-hyprland.enable = true;
environment.sessionVariables.NIXOS_OZONE_WL = "1"; # fixes some electron stuff
}
