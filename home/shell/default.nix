{ config, ... }:

{

  imports = [
    ./zsh
    ./alacritty
    ./tmux
    ./common.nix
    ./starship.nix
  ];

}
