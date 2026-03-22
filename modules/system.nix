{ pkgs, lib, username, ... }:

{
  imports =
    [ 
      ./fonts
      ./audio
      ./optimizations

      ./services/asus
      ./services/flatpak
      ./services/docker
      ./services/lamp
      ./services/astersik

      ./desktop/plasma
      ./desktop/niri

      ./apps/applications.nix
    ];
  
  # ----- Users -----
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" "lp" "scanner" "docker" ];
  };

  nix.settings.trusted-users = [username];


  # ----- Nix Settings -----
  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };

  # ------ System Basics ------ 
  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_MX.UTF-8";
    LC_IDENTIFICATION = "es_MX.UTF-8";
    LC_MEASUREMENT = "es_MX.UTF-8";
    LC_MONETARY = "es_MX.UTF-8";
    LC_NAME = "es_MX.UTF-8";
    LC_NUMERIC = "es_MX.UTF-8";
    LC_PAPER = "es_MX.UTF-8";
    LC_TELEPHONE = "es_MX.UTF-8";
    LC_TIME = "es_MX.UTF-8"; 
  };
 
 
 # ----- DESKTOP CONFIGURATION ----- 
  # Enable and configuring the X11 windowing system.
  services.xserver.enable = true;

  # Enable Wayland support for X11 apps 
  programs.xwayland.enable = true;
  
  # Enable sddm
  services.displayManager.sddm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Noctalia services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # ----- Service -----
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Oh My Zsh 
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  # Hardware Configuration 


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}

