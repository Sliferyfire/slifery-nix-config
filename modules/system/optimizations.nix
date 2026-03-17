{ config, pkgs, ... }:

{

  # ----- System Maintenance ----- 
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 20d";
  };

  nix.optimise = {
    automatic = true;
    dates = ["weekly"];
  };

}
