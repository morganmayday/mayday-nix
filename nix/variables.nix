{ lib, ... }:
with lib;
{
  options.mymodule = {
    hostname = mkOption {
      type = types.str;
      default = "atlas";
      description = "Hostname";
    };
  };
  options.mymodule = {
    username = mkOption {
      type = types.str;
      default = "medea";
      description = "Username";
    };
  };
  options.mymodule = {
    hardware = mkOption {
      type = types.str;
      default = "atlas";
      description = "framework-12-13th-gen-intel";
    };
  };
}
