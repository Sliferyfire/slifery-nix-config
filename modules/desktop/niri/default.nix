{ config, pkgs, ... }:

{

  # Enable Niri Display Manager
  programs.niri.enable = true;
  services.displayManager.defaultSession = "niri";

}
