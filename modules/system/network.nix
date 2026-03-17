{ config, pkgs, ... }:

{

  # Network Configuration 
  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # Enable and configure bluetooth 
    hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; 
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  # Enable blueman bluetooth manager 
  services.blueman.enable = true;
  

   # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}

