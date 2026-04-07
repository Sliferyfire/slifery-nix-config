{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [ 
    kdePackages.kate
    discord
    dbeaver-bin
    obsidian
    prismlauncher
    heroic

    # Code formater 
    prettier 
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
 
}
