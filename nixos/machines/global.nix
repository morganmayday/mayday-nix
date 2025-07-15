# File loaded on ALL machines, representing slimmest basestate.

{
  environment.systemPackages = with pkgs; [
    firefox # core web browser
    kdePackages.dolphin # the only goddamn file manager I like
    kdePackages.kate # text editor
    kdePackages.konsole # CLI terminal
    bash # scripting tool
    nano # CLI text editor
    git # --gud
    networkmanager # network manager
    zip # CLI zip tool
    unzip # CLI unzip tool
    nix-search-cli # CLI tool for search.nixos.org
    linux-firmware # firmware
    neofetch # not strictly necessary but it's nice vanity
  ]
};

  graphical.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
