# File loaded on ALL machines, representing unreasonably slim basestate.

{
  environment.systemPackages = with pkgs; [
    kdePackages.konsole # CLI terminal
    bash # scripting tool
    nano # CLI text editor
    git # --gud
    networkmanager # network manager
    zip # CLI zip tool
    unzip # CLI unzip tool
    nix-search-cli # CLI tool for search.nixos.org
    linux-firmware # firmware
    killall # kills all
    kill # kills
    cfdisk # disk repartition CLI tool
    ls # ls
  ]
};
