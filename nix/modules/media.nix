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
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    perl540Packages.Mojolicious
  ];
}
