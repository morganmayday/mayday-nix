# Notes:
# 'mayday-nix' should be your config directory, rename as necessary
# 'mayday' in the path should be your username

nix-channel --update
cd mayday-nix
git commit -a
sudo nixos-rebuild switch --upgrade --flake /home/mayday/mayday-nix
reboot
