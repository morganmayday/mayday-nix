# File loaded on ALL machines, representing base services.

# Boot
boot.loader.systemd-boot.enable = true; # boots
boot.loader.efi.canTouchEfiVariables = true; # lets you actually change shit
systemd.user.startServices = "sd-switch"; # so services restart nicely on rebuild

# GUI
services.xserver = {  # I forgot what exactly this does but I know it's essential
  enable = true;
  xkb.layout = "us";
  xkb.variant = "";
};
services.displayManager.lightdm.enable = true; # enables LightDM display manager
services.xserver.desktopManager.cinnamon.enable = true; # enables Cinnamon DE
graphical.enable = true; # enables graphical

# Basic functionality
services.udiskie.enable = true; # automounts removable drives
networking = { 
  networkmanager = { 
    enable = true; # allow startup on boot };
    nameservers = [ "9.9.9.9" ];
    enableIPv6 = false;
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "wlan0"; # you may have to change this but probably not
    };
};

# Situational, here til I move em
programs.steam.enable = true;

# Timezone & localization
time.timeZone = "US/Pacific";
i18n.defaultLocale = "en_US.UTF-8";
