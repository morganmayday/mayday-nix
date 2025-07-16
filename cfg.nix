# Core config file

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    ./machines/hw-cfg-medea.nix # hardware-generated config, machine-specific, renamed from hardware-configuration.nix
    ./machines/medea.nix # update based on machine name
    ./modules
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
  };

  nix.gc = { # garbage collection
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  users.users = {
    mayday = {  # replace with your username
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "wireshark" ];
      shell = pkgs.bash;
      # openssh.authorizedKeys.keys = [
        # Add your SSH public key(s) here, if you plan on using SSH to connect
      # ];
    };
  };
  };
}
