
{ inputs, outputs, lib, config, pkgs, ... }: 

let
username = "mayday"; # update here and it will update your username in the rest of this file
machinename = "atlas"; # update here and it will update your machinename in the rest of this file
in

{

  system.stateVersion = "25.05"; # DO NOT TOUCH THIS LINE IT WILL BREAK EVERYTHING


  # You can import other NixOS modules here
  imports = [
    ./machines/hw-cfg-${machinename}.nix # hardware-generated config, machine-specific, renamed from hardware-configuration.nix
    ./machines/${machinename}.nix # machine-specific config
    ./modules/master.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true; # allows proprietary packages
      allowUnfreePredicate = (_: true);
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes"; # Enable flakes and 'nix' command both of which are really useful
    };
    gc = { # garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
      };
  };

  # boot.initrd.kernelModules = [ "pinctrl_tigerlake" ];  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # programs.iio-hyprland.enable = true;
  hardware.sensor.iio.enable = true;

  users.users = {
    ${username} = { 
      isNormalUser = true;
      # password = "correcthorsebatterystaple"; # comment this line once you've manually changed your password with the passwd command, DO NOT put a real password here--you'll use this to log in once you rebuild. referencing XKCD 936
      extraGroups = [ "networkmanager" "wheel" "wireshark" ];
      shell = pkgs.bash;
      # openssh.authorizedKeys.keys = [
        # Add your SSH public key(s) here, if you plan on using SSH to connect
      # ];
    };
  };
  }
