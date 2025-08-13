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
  };

  outputs = { self, nixpkgs, lix, lix-module, nixos-hardware, ... }@inputs:

  let
  username = "mayday"; # update here and it will update your username in the rest of this file
  machinename = "atlas";
  in
  {
    nixosConfigurations.${machinename} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # can be changed but lbr. probably dont need to
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./machines/${machinename}.nix
        ./modules/master.nix
        lix-module.nixosModules.default
        nixos-hardware.nixosModules.framework-12-13th-gen-intel # Machine-specific, change as needed
      ];
      environment.variables = [
        EDITOR = "nano";
        USER = "${username}";
        HOSTNAME = "${hostname}";
      ];
    };
  };
}
