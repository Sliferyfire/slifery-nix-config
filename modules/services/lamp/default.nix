{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    php
    phpPackages.composer 
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.httpd = {
    enable = true;
    adminAddr = "admin@localhost";
    enablePHP = true; # Esto instala PHP automáticamente
    
    phpPackage = pkgs.php.buildEnv {
      extensions = ({ enabled, all }: enabled ++ [ 
        all.mysqli 
	all.pdo_mysql
	all.mbstring 
        all.openssl 
        all.curl 
        all.zip
      ]);
    };

    virtualHosts."localhost" = {
      # Cambia esto a una ruta donde tu usuario tenga permisos, 
      # o asegúrate de que el usuario 'httpd' pueda leer /var/www
      documentRoot = "/var/www/html";
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureDatabases = [ "mi_proyecto" ];
    ensureUsers = [{
      name = "dbuser";
      ensurePermissions = { "mi_proyecto.*" = "ALL PRIVILEGES"; };
    }];
  };

}
