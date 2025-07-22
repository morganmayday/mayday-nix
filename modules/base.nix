# File loaded on ALL machines, representing slimmest reasonable basestate.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cinnamon-common # Cinnamon desktop environment    
    firefox # core web browser
    kdePackages.kate # text editor
    neofetch # sysinfo vanity
  ];
}
