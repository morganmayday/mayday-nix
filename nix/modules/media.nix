# Tools
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  prismlauncher # minecraft launcher
  ];
programs.steam.enable = true;
}
