{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    asusctl
  ];

  # Asus Tools
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
  services.supergfxd.enable = true; 

}

