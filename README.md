``` 
 __  __                 _                  _   _ _      
|  \/  | __ _ _   _  __| | __ _ _   _     | \ | (_)_  __
| |\/| |/ _` | | | |/ _` |/ _` | | | |    |  \| | \ \/ /
| |  | | (_| | |_| | (_| | (_| | |_| |    | |\  | |>  < 
|_|  |_|\__,_|\__, |\__,_|\__,_|\__, |    |_| \_|_/_/\_\
              |___/             |___/                   
```


Heyo! I'm Morgan Mayday, this is my customized NixOS & Hyprland config. This is the Cinnamon release, a stable version that should Just Work with minimal tinkering. Version number: 0.3.2-cinnamon-stable. *This is not the Hyprland release, but contains most of the stuff I have from my Hyprland builds in case you want to switch.*

TODO: Write a proper setup script.

#### Install Instructions: Fresh
From a fresh NixOS ISO, begin by going through the base setup process. The only things that will continue to matter are your **partitioning**, your **hostname**, and your **username**--we'll overwrite everything but the partitioning scheme, and your hostname and username break things weird if they're different from what you'll put in this dotfile set.

Once you boot into the NixOS install, move the contents of this repo into `$HOME/dotfiles`. This can be done via move command or GUI--you should end up with this file and the subfolders in `/home/$USERNAME/dotfiles`. 

Navigate into the provided `nix` directory, and edit `flake.nix` in your preferred text editor.

Navigate into the provided `scripts` directory, and either right click -> properties -> mark as executable `rebuild.sh`, or run `chmod +x rebuild.sh` in that directory.
