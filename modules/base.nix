# File loaded on ALL machines, representing slimmest reasonable basestate.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cinnamon-common # Cinnamon desktop environment    
    firefox # core web browser
    kdePackages.dolphin # the only goddamn file manager I like
    kdePackages.kate # text editor
    lightdm # Cinnamon's display manager
    neofetch # sysinfo vanity
  ]
}
