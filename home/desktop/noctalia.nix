{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    
    settings = {
      general = {
        avatarImage = "/home/sliferyfire/Pictures/avatar.png"; 
        radiusRatio = 0.2;
      };

      location = {
        monthBeforeDay = false; 
        name = "Mexico City, Mexico";
      };

      colorSchemes.predefinedScheme = "Monochrome"; 

      bar = {
        density = "compact";
        position = "top"; 
        showCapsule = true;
        
        widgets = {
          left = [
            { id = "ControlCenter"; useDistroLogo = true; }
            { id = "Network"; }
            { id = "Bluetooth"; }
          ];
          center = [
            { id = "Workspace"; hideUnoccupied = true; }
          ];
          right = [
            { id = "Battery"; }
            { id = "Clock"; useMonospacedFont = true; }
          ];
        };
      };
    };
  };
}
