{pkgs, ...}: 

{

  imports = [
    ../../home/core.nix
    ./git.nix

    ../../home/programs
    ../../home/shell
    ../../home/nvfvim
    ../../home/niri
    ../../home/niri/noctalia
  ];

}
