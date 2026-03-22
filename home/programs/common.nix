{ config, pkgs, lib, ... }:

{

  imports = [
    ../desktop/noctalia.nix 
  ];

  home.packages = with pkgs; [ 
    kdePackages.kate
    discord
    dbeaver-bin
    obsidian
    spotify
    spicetify-cli
    prismlauncher
  ];

  # Bash config
  programs.bash.enable = true;
  programs.bash.shellAliases= {
    ls = "ls -h --color=auto --group-directories-first";
    la = "ls -a --color=auto --group-directories-first";
    ll = "ls -l";
    c = "clear";
    rm = "rm -iv";
    cp = "cp -iv";
    mv = "mv -iv";
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
 
}
