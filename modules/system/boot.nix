{ config, pkgs, ... }: 

{

  # Asus linux instalation 
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = { 
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };   
  };

}

