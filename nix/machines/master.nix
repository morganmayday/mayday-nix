{ inputs, config, pkgs, ... }:
{
imports =
    [
      ./${variables.hostname}.nix
    ];
}
