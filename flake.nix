{
  description = "MAYDAY MAYDAY I NEED TO FIX MY CONFIG!";

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

  outputs = { self, nixpkgs, lix, lix-module, home-manager, nixos-hardware, ... }@inputs: 

  let
  username = "mayday"; # update here and it will update your username in the rest of this file
  machinename = "medea"; # update here and it will update your machinename in the rest of this file
  in
  {
    nixosConfigurations.${machinename} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # can be changed but lbr. probably dont need to
      specialArgs = { inherit inputs; };
      modules = [
        ./machines/${machinename}.nix
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
          home-manager.users.${username} = {
            imports = [
              ./machines/${machinename}.nix
            ];
          };
        }
      ];
    };
  };
}
