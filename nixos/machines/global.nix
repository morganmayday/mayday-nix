# File loaded on ALL machines, representing slimmest basestate.

{
  environment.systemPackages = with pkgs; [
    firefox # core web browser
    kdePackages.dolphin # the only goddamn file manager I like
    kdePackages.kate # text editor
    
  ]
}
