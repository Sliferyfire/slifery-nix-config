{ config, pkgs, ... }:

{

  # Enable and configure git 
  programs.git = {
    enable = true;
    package = pkgs.git;
    config = {
      user.name = "Sliferyfire";
      user.email = "sliferyfire@gmail.com";
      init.defaultBranch = "main";
    };
  };

}
