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

    # Dev 
    nodejs_24
    yarn
    python311 
    uv

    # Other pckgs
    wget
    curl
    sysstat
    lm_sensors
    usbutils
    # Copy and paste from neovim
    wl-clipboard
    fastfetch
  ];

}
