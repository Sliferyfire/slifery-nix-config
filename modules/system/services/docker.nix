{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # Docker pckgs
    docker
    docker-compose
  ];

  # Enable docker 
  virtualisation.docker = {
    enable = true;
  };

}

