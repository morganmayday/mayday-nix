{
  description = "MAYDAY MAYDAY I NEED TO FIX MY CONFIG!";
  system.stateVersion = "25.05"; # DO NOT TOUCH THIS LINE

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.2-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lix, lix-module, home-manager, nixos-hardware, ... }@inputs: {
    nixosConfigurations.medea = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./machines/medea.nix
        ./modules/base.nix
        ./modules/daily.nix
        ./modules/frame.nix
        ./modules/services.nix
        lix-module.nixosModules.default
        nixos-hardware.nixosModules.hp-laptop-14s-dq2024nf # Medea-specific, change as needed
        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.mayday = {
            imports = [
              ./home/default.nix
            ];
          };
        }
      ];
    };
  };
}
