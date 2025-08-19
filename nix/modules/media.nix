# Tools
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  prismlauncher # minecraft launcher
  vlc # media player
  ];
programs.steam.enable = true;
}
