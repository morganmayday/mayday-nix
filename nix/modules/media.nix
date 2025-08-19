# Tools
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  calibre # ebook reader
  prismlauncher # minecraft launcher
  vlc # media player
  zathura # PDF viewer
  ];
programs.steam.enable = true;
}
