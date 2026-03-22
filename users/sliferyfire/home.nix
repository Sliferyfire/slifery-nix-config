{pkgs, ...}: 

{

  imports = [
    ../../home/core.nix
    ./git

    ../../home/programs
    
  ];

}
