# File loaded on ALL machines, representing base services.

# Boot
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

# GUI
services.xserver.enable = true;
services.displayManager.lightdm.enable = true;
services.xserver.desktopManager.cinnamon.enable = true;
graphical.enable = true;

