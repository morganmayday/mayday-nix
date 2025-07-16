# File loaded on ALL machines, representing slimmest reasonable basestate.

{
  environment.systemPackages = with pkgs; [
    firefox # core web browser
    kdePackages.dolphin # the only goddamn file manager I like
    kdePackages.kate # text editor
    neofetch # sysinfo vanity
  ]
};

  graphical.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
