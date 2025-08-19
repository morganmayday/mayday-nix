{ inputs, config, pkgs, ... }:
{
nix.package = pkgs.lix;
imports =
    [
      ./${variables.hostname}.nix
    ];
}
