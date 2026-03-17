{ config, pkgs, ... }:

{

  # Install firefox.
  programs.firefox.enable = true;

  # Steam Config 
  programs.steam.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # utils
    neovim
    vscode-fhs

    # Graphic settings pckgs
    intel-gpu-tools
    pciutils

    # Other pckgs
    wget
    usbutils
    # Copy and paste from neovim
    wl-clipboard
    fastfetch
  ];

}
