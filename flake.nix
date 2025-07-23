{
  description = "A bespoke config, built by Morgan Mayday for itself and also for newer users";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.2-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lix, lix-module, nixos-hardware, ... }@inputs:

  let
  username = "mayday"; # update here and it will update your username in the rest of this file
  machinename = "medea"; # update here and it will update your machinename in the rest of this file
  in
  {
    nixosConfigurations.${machinename} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # can be changed but lbr. probably dont need to
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./machines/${machinename}.nix
        ./modules
        lix-module.nixosModules.default
        nixos-hardware.nixosModules.hp-laptop-14s-dq2024nf # Machine-specific, change as needed
      ];
    };
  };
}
