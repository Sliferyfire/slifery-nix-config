{ config, pkgs, ... }:

{

  imports = [
    ../../modules/system.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Asus linux instalation 
  boot.kernelPackages = pkgs.linuxPackages;

  # ----- Boot -----
  
  # Bootloader
  boot.loader = { 
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };   
  };
  
  # ----- Network -----

  # Network Host name
  networking.hostName = "rog-strix"; 
  
  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 5060 ];
  networking.firewall.allowedUDPPorts = [ 5060 ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 10000; to = 20000; }
  ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

 # ----- BLUETOOTH -----

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

  # ----- GPU Settings -----

  # for Nvidia GPU
  services.xserver.videoDrivers = ["nvidia"];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;

    open = true;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
