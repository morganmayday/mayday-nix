# File loaded on ALL machines, representing unreasonably slim basestate.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bash # scripting tool
    git # --gud
    kdePackages.konsole # my comfort terminal
    killall # kills all
    linux-firmware # firmware
    nano # CLI text editor
    networkmanager # network manager
    nix-search-cli # CLI tool for search.nixos.org
    unzip # CLI unzip tool
    zip # CLI zip tool
  ];
  fonts.packages = with pkgs; [ # bunch o' fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    garamond-libre
];
}
