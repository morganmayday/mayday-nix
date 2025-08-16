# File loaded on ALL machines, representing slimmest reasonable basestate.
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bash # scripting tool
    git # --gud
    firefox # core web browser
    linux-firmware # firmware
    kdePackages.konsole # comfort terminal
    nano # cli text editor
    neofetch # sysinfo vanity
    networkmanager # network manager
    pipewire # screen and audio sharing stuff
    wget
	neovide
	hackneyed
	neovim
    dbus
    unzip # cli unzip
    zip # cli zip
    fwupd # firmware updater
	nemo
	hyprcursor
	kdePackages.kate
  ];
  fonts.packages = with pkgs; [ # bunch o' fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    garamond-libre
];

boot.loader.systemd-boot.enable = true; # boots
boot.loader.efi.canTouchEfiVariables = true; # lets you actually change shit
services.fwupd.enable = true; # enables firmware updating

gtk = {
  enable = true;
  # cursorTheme = {
    # name = "Hackneyed";
      # package = pkgs.hackneyed;
      # };
      gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

      gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };};
hardware.graphics.enable = true; # enables graphics
services.xserver = {  # I forgot what exactly this does but I know it's essential
  enable = true;
  xkb.layout = "us";
  xkb.variant = "";
};
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
programs.fuse.userAllowOther = true; # allows Fuse to do things with sudo basically
programs.git.enable = true;
# if you ever need appimages this is magic code that does magic
boot.binfmt.registrations.appimage = {
		wrapInterpreterInShell = false;
		interpreter = "${pkgs.appimage-run}/bin/appimage-run";
		recognitionType = "magic";
		offset = 0;
		mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
		magicOrExtension = ''\x7fELF....AI\x02'';
};
services.displayManager.sddm.enable = true;
services.displayManager.sddm.wayland.enable = true;
# --- POWER ---
services.logind.extraConfig = ''
		HandleLidSwitch=suspend-then-hibernate # when laptop screen closed, turn off
     		HandlePowerKey=poweroff # actually power off when power button pressed
		'';
powerManagement.enable = true;

# --- SECURITY & SAFETY ---
security.polkit.enable = true;
	security.sudo.extraConfig = "Defaults insults"; # will insult you when you get your password wrong in sudo
services.thermald.enable = true; # temp manager, likely unnecessary but better safe than sorry
security.rtkit.enable = true; # realtime scheduling for user processes, needed for pipewire
security.soteria.enable = true; # can be disabled if you a aren't on Wayland b not on a standalone winmanager c have a GUI polkit auth agent in your DE
programs.gnupg.agent = { # gnupg is an encryption/PGP thing
	enable = true;
	enableSSHSupport = true;
};

# --- LOCALE ---
time.timeZone = "US/Pacific";
i18n.defaultLocale = "en_US.UTF-8";

}
