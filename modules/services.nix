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
hardware.graphics.enable = true; # enables graphics. not sure which of these lines is the redundancy

# Basic functionality
services.udiskie.enable = true; # automounts removable drives
services.udisks2.enable = true; # mount on /media
services.udisks2.mountOnMedia = true; # mount on /media
services.locate = { # system indexing/searching
		enable = true;
		package = pkgs.plocate;
	};
services.pipewire = { # audio
		enable = true;
		audio.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		wireplumber.enable = true;
	};
services.cron.enable = true; # timebased job scheduler
services.atd.enable = true; # command scheduler
services.tumbler.enable = true; # generates thumbnails
services.envfs.enable = true; # symlink/PATH stuff
services.flatpak.enable = true; # lets you use flatpak if necessary
services.gvfs.enable = true; # userspace virtual file system
# if you ever need appimages this is magic code that does magic
boot.binfmt.registrations.appimage = {
		wrapInterpreterInShell = false;
		interpreter = "${pkgs.appimage-run}/bin/appimage-run";
		recognitionType = "magic";
		offset = 0;
		mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
		magicOrExtension = ''\x7fELF....AI\x02'';
};

# Networking
networking = {  # connect to the internet
  networkmanager = { 
    enable = true; # allow startup on boot 
  };
  nameservers = [ "9.9.9.9" ]; # this is your nameserver, if you don't know what that means 1.1.1.1 and 9.9.9.9 are the ones I've used
  enableIPv6 = false; # IPv6 is unreliable and not compatible with some hardware ime
  nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "wlan0"; # you may have to change this but probably not, it's based on what your wifi chip is. will have to work out ethernet later
  };
  firewall = {
    enable = true; # protecting you from Malady's wares
    # open ports in firewall below
	  # allowedTCPPorts = [ ... ];
	  # allowedUDPPorts = [ ... ];
  };
};
services.avahi = { # LAN discovery
		enable = true;
		nssmdns4 = true;
		openFirewall = true;
	};
services.blueman.enable = false; # bluetooth, change to true if needed
hardware.bluetooth.enable = false; # bluetooth, change to true if needed
hardware.bluetooth.powerOnBoot = false; # bluetooth on boot
services.printing = { # good luck getting printers actually working lmao
		enable = true;
		drivers = [ pkgs.gutenprint pkgs.hplip];
	};
services.openssh.enable = true; # if you aren't using openssh, you should probably turn this off to be safe
programs.gnupg.agent = { # gnupg is an encryption/PGP thing
	enable = true;
	enableSSHSupport = true;
};

# Power
services.logind.extraConfig = ''
		HandleLidSwitch=suspend-then-hibernate # when laptop screen closed, turn off
		HandlePowerKey=poweroff # actually power off when power button pressed
		'';

# Security & safety
security.polkit.enable = true;
	security.sudo.extraConfig = "Defaults insults"; # will insult you when you get your password wrong in sudo
services.thermald.enable = true; # temp manager, likely unnecessary but better safe than sorry
security.rtkit.enable = true; # realtime scheduling for user processes, needed for pipewire
security.soteria.enable = true; # can be disabled if you a) aren't on Wayland b) not on a standalone winmanager c) have a GUI polkit auth agent in your DE

# I'm not gonna bother sorting these, I assume they were in my old config for a reason. Will reassess later.
programs.fuse.userAllowOther = true;
programs.xfconf.enable = true;
programs.mtr.enable = true;
programs.mosh.enable = true;

# Situational, here til I move em
programs.steam.enable = true;

# Timezone & localization
time.timeZone = "US/Pacific";
i18n.defaultLocale = "en_US.UTF-8";
