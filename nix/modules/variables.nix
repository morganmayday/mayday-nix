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
}
