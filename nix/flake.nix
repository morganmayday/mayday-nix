{
  description = "Morgan Mayday's config, version 0.3.2-hyprland-unstable";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    oxide_timer = { # Morrigan's timer
      url = "path:./modules/oxide_timer";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }@inputs:
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
        nixos-hardware.nixosModules.${variables.hardware}
      ];
    };
  };
}
