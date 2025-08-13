{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    signal-desktop-bin # signal desktop client
    # scli # CLI interface for signal
    # thunderbird # mozilla's mail client which i am currently not using
    vesktop # actually-functional discord client for linux
  ];

}
