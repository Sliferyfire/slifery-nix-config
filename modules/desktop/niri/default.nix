{ config, pkgs, ... }:

{

  # Enable Niri Display Manager
  programs.niri.enable = true;
  services.displayManager.defaultSession = "niri";
  
  environment.systemPackages = with pkgs; [
    fuzzel
    xwayland
    alacritty
  ];

}
