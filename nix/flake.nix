{
  description = "A bespoke config, built by Morgan Mayday for itself and also for newer users";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # nixpkgs.url = "nixpkgs/nixos-unstable";
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
      system = "x86_64-linux"; # can be changed but lbr. probably dont need to
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
