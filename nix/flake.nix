{
  description = "A bespoke config, built by Morgan Mayday for itself and also for newer users";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # lix = { # I'm not gonna get Too Into why I use Lix but suffice to say I did make this choice on purpose
    #   url = "https://git.lix.systems/lix-project/lix/archive/release-2.93.tar.gz";
    #   flake = false;
    # };
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # lix-module = {
    #   url = "https://git.lix.systems/lix-project/nixos-module/archive/release-2.93.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    oxide_timer = { # morrigan's timer
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
      system = "x86_64-linux"; # can be changed but lbr. probably dont need to
      specialArgs = { inherit inputs variables; };
      modules = [
        ./configuration.nix
        ./machines/${variables.hostname}.nix
        ./modules/master.nix
        # lix-module.nixosModules.default
        nixos-hardware.nixosModules.${variables.hardware}
      ];
    };
  };
}
