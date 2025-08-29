``` 
 __  __                 _                  _   _ _      
|  \/  | __ _ _   _  __| | __ _ _   _     | \ | (_)_  __
| |\/| |/ _` | | | |/ _` |/ _` | | | |    |  \| | \ \/ /
| |  | | (_| | |_| | (_| | (_| | |_| |    | |\  | |>  < 
|_|  |_|\__,_|\__, |\__,_|\__,_|\__, |    |_| \_|_/_/\_\
              |___/             |___/                   
```

Heyo! I'm Morgan Mayday, this is my customized NixOS & Hyprland config. Version number: 0.3.2-hyprland-unstable.

TODO: Write a proper setup script.

TODO: Write install instructions from a non-fresh install.

#### Install Instructions: Fresh
From a fresh NixOS ISO, begin by going through the base setup process. The only things that will continue to matter are your **partitioning**, your **hostname**, and your **username**--we'll overwrite everything but the partitioning scheme, and your hostname and username break things weird if they're different from what you'll put in this dotfile set.

Once you boot into the NixOS install, move the contents of this repo into `$HOME/dotfiles`. This can be done via move command or GUI--you should end up with this file and the subfolders in `/home/YOUR-USERNAME/dotfiles`. 

Navigate into the provided `nix` directory, and edit `flake.nix` in your preferred text editor. You want to change the below to match your hardware, hostname, and username. If you don't know what NixOS calls your hardware, you can search around [here](https://github.com/NixOS/nixos-hardware).

```
let
    variables = {
      username = "mayday";
      hostname = "atlas";
      hardware = "framework-12-13th-gen-intel";
    };
in
```

Navigate into the provided `nix/machines` directory, copy `atlas.nix`, and rename it to match your hostname. In the file's first line, change `framework-12-13th-gen-intel` to match your hardware.

Navigate into the *existing* directory `/etc/nixos`, copy `hardware-configuration.nix`, move the copy to `nix/machines`, and rename it `hw-cfg-YOUR-HOSTNAME.nix`.

Navigate into the provided `scripts` directory, and either right click -> properties -> mark as executable `rebuild.sh`, or run `chmod +x rebuild.sh` in that directory.

Run `nix-shell -p git` to enable all necessary functions for rebuilding.

In `$HOME/dotfiles`, run `git init`. Configure your email and username with git.

Run `rebuild.sh` via `bash rebuild.sh` in the `scripts` directory. Right click running won't work.
Reboot, and you should be good!
