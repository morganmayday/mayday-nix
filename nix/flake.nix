{
  description = "Morgan Mayday's config, version 0.3.2-unstable";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # nixpkgs.url = "nixpkgs/nixos-unstable";
    # Note: if using nixpkgs unstable, you should use the Lix package as described in https://lix.systems/add-to-config/ rather than the overlay below
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/release-2.93.3-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oxide_timer = { # morrigan's timer
      url = "path:./modules/oxide_timer";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, lix-module, ... }@inputs:
  let
    variables = {
      username = "mayday";
      hostname = "atlas";
      hardware = "framework-12-13th-gen-intel";
    };
  in
  {
    nixosConfigurations.${variables.hostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs variables; };
      modules = [
        ./configuration.nix
        ./machines/${variables.hostname}.nix
        ./modules/master.nix
        lix-module.nixosModules.default
        nixos-hardware.nixosModules.${variables.hardware}
      ];
    };
  };
}
