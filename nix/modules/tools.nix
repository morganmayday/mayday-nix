# Tools
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  cargo
  gradle # for minecraft modding fuckshit
  appimage-run # if you need appimages
  btop # resource monitor
  dust # disk usage mapper
  ffmpeg # useful audio thingy
  fzf # CLI fuzzy finder
  gparted # graphical disk partitioner
  mullvad-vpn # mullvad vpn
  p7zip # ziptool
  wine # win compat layer
  yt-dlp # delps yeet
  inkscape-with-extensions # vector graphics maker
  # kapow # project time tracker that i really should use but i do NOT wanna know how much time i waste
  libreoffice # libreoffice
  obsidian
  pinta # paint.net clone. you should not use this but i do <3
  rust
  speedcrunch # best calculator app i've ever used
  vlc # media player
  zathura # PDF viewer
  ];
  inputs.oxide_timer.packages.${pkgs.system}.default = true;
}
