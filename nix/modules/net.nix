{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    signal-desktop # signal desktop client. NOTE: may not function on stable branch.
    # scli # CLI interface for signal
    # thunderbird # mozilla's mail client which i am currently not using
    vesktop # actually-functional discord client for linux
	mullvad-vpn # mullvad vpn
  ];
networking = {  # connect to the internet
  networkmanager = {
    enable = true; # allow startup on boot
  };
  nameservers = [ "9.9.9.9" ]; # this is your nameserver, if you don't know what that means 1.1.1.1 and 9.9.9.9 are the ones I've used
  enableIPv6 = false; # IPv6 is unreliable and not compatible with some hardware ime
  nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "wlan0"; # you may have to change this but probably not, it's based on what your wifi chip is
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
services.openssh.enable = false; # if you aren't using ssh, you should probably turn this off to be safe
programs.mosh.enable = false; # ssh alternative
programs.mtr.enable = true; # network diagnostics tool

}
