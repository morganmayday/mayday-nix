{ inputs, outputs, lib, config, pkgs, variables, ... }:

# let
#   inherit (import ./variables.nix);
# in

{

  system.stateVersion = "25.05"; # DO NOT TOUCH THIS LINE IT WILL BREAK EVERYTHING

  # You can import other NixOS modules here
  imports = [
    # /etc/nixos/hardware-configuration.nix # can be remapped if you move your hardware config but need to use --impure otherwise
    # ./variables.nix
    ./modules/master.nix
    ./machines/${variables.hostname}.nix # machine-specific config
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

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.sensor.iio.enable = true; # 2in1 specific

  users.users = {
     ${variables.username} = {
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
