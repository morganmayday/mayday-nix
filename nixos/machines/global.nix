# File loaded on ALL machines, representing slimmest basestate.

{
  environment.systemPackages = with pkgs; [
    firefox # core web browser
    kdePackages.dolphin # the only goddamn file manager I like
    kdePackages.kate # text editor
    nano # CLI text editor
    git # --gud
    networkmanager # network manager
    zip # CLI zip tool
    unzip # CLI unzip tool
  ]
};

  graphical.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
