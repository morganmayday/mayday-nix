# Tools
{ inputs, config, pkgs,  ... }:
{
  environment.systemPackages = with pkgs; [
  cargo # for Rust shenanigans
  gradle # for minecraft modding fuckshit
  appimage-run # if you need appimages
  gh # github
  # btop # resource monitor. Cinnamon has a builtin version, so usually unnecessary on Cinnamon.
  dust # disk usage mapper
  ffmpeg # useful audio thingy
  fzf # CLI fuzzy finder
  gparted # graphical disk partitioner
  p7zip # ziptool
  wine # win compat layer
  yt-dlp # delps yeet
  inkscape-with-extensions # vector graphics maker
  # kapow # project time tracker that i really should use but i do NOT wanna know how much time i waste
  libreoffice # libreoffice
  obsidian # notes software
  # pinta # paint.net clone. you should not use this but i do <3
  speedcrunch # best calculator app i've ever used
  inputs.oxide_timer.packages.${pkgs.system}.default # imports morrigan's timer, oxide, which may or may not work
  ];
}
