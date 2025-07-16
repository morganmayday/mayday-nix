# File loaded on ALL machines, representing base services.

# Boot
boot.loader.systemd-boot.enable = true; # boots
boot.loader.efi.canTouchEfiVariables = true; # lets you actually change shit
systemd.user.startServices = "sd-switch"; # so services restart nicely on rebuild

# GUI
services.xserver.enable = true; # I forgot what exactly this does but I know it's essential
services.displayManager.lightdm.enable = true; # enables LightDM display manager
services.xserver.desktopManager.cinnamon.enable = true; # enables Cinnamon DE
graphical.enable = true; # enables graphical

# General other shit
services.udiskie.enable = true; # automounts removable drives

# Situational, here til I move em
programs.steam.enable = true;
