``` 
 __  __                 _                  _   _ _      
|  \/  | __ _ _   _  __| | __ _ _   _     | \ | (_)_  __
| |\/| |/ _` | | | |/ _` |/ _` | | | |    |  \| | \ \/ /
| |  | | (_| | |_| | (_| | (_| | |_| |    | |\  | |>  < 
|_|  |_|\__,_|\__, |\__,_|\__,_|\__, |    |_| \_|_/_/\_\
              |___/             |___/                   
```


Heyo! I'm Morgan Mayday, this is my customized NixOS config. Version number: 0.1.0

### Auto-Setup
Run `RUNME.sh`. This is _not recommended_ if you have an existing config, it _will_ overwrite your user account and `.bashrc` & I don't use Home Manager so things might get fucky.
### Manual Setup
Read `RUNME.sh` and do it step by step. If you have an existing config, copying your user over is recommended, and if you have anything in your `.bashrc` you care about please please save it.
### Naming Conventions
`/eou/` stands for Ease Of Use. I may sort it in a later iteration; right now I use it to store miscellaneous ascii files and all my shell scripts.

`/machines/` keeps a folder of all of my machine configs. Running `RUNME.sh` will overwrite Medea with your machine.

`/modules/` is used to load packages. There's definitely a better way than listing each module, but that's what I did, so if you add more files to the folder you'll have to edit at least `configuration.nix` and `flake.nix`. 

`/modules/base.nix` is my slimmest reasonable basestate. Realistically, I could go lighter, but I probably won't.

`/modules/frame.nix` is my unreasonably slim basestate. Realistically again, I could go lighter, but I'm never just loading this anyways, I just use it for organisation.

`/modules/daily.nix` is my daily-driver software. Everything kinda falls into there right now, cause I don't have anything that situational.

`/modules/services.nix` enables most of the services and sets locale.
### Tips & Tricks
`/eou/script-map.sh` will automap *all* `.sh` files in the folder to your `.bashrc` with their name as an alias--for example, `rebuild.sh` can be run with `rebuild` in the terminal after running this script. `RUNME.sh` runs this, but doesn't get indexed by `script-map`.
