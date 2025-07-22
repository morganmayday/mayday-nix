# File loaded on MOST machines, representing useful apps.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # --- COMMS  ---
    signal-desktop # signal desktop client
    scli # CLI interface for signal
    # thunderbird # mozilla's mail client which i am currently not using
    vesktop # actually-functional discord client for linux
    # --- TOOLS ---
    appimage-run # if you need appimages
    btop # resource monitor
    dust # disk usage mapper
    dbus # interprocess messaging system, probably should be in base.nix
    ffmpeg # useful audio thingy
    fzf # CLI fuzzy finder
    gparted # graphical disk partitioner
    mullvad-vpn # mullvad vpn
    p7zip # ziptool
    wget # pulls stuff from the web
    wine # win compat layer
    yt-dlp # delps yeet
    # --- OFFICE & MEDIA ---
    inkscape-with-extensions # vector graphics maker
    kapow # project time tracker that i really should use but i do NOT wanna know how much time i waste
    libreoffice # libreoffice
    logseq # testing as obsidian replacement
    pinta # paint.net clone. you should not use this but i do <3
    prismlauncher # minecraft launcher
    speedcrunch # best calculator app i've ever used
    vlc # media player
    zathura # PDF viewer
  ];
  programs.steam.enable = true;
}
