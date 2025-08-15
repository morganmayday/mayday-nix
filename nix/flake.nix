{
  description = "A bespoke config, built by Morgan Mayday for itself and also for newer users";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    lix = { # I'm not gonna get Too Into why I use Lix but suffice to say I did make this choice on purpose
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oxide_timer = { # morrigan's timer script
      url = "path:./modules/oxide_timer";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, lix, lix-module, nixos-hardware, ... }@inputs:
  {
  variables = ./variables.nix;

    nixosConfigurations = (
      import ./variables.nix {
        inherit inputs variables; }
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # can be changed but lbr. probably dont need to
        specialArgs = { inherit inputs variables; };
        modules = [
          ./configuration.nix
          ./machines/master.nix
          ./modules/master.nix
          lix-module.nixosModules.default
          nixos-hardware.nixosModules.variables.hardware
      ];
    });
    };
  };
}
