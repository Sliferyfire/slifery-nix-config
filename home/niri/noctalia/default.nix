{ inputs, config, pkgs, ... }:

let
  noctaliaJson = builtins.fromJSON (builtins.readFile ./noctalia.json);
in
{
  
  imports = [inputs.noctalia.homeModules.default];

  programs.noctalia-shell = {
    enable = true;
    settings = noctaliaJson.settings;
  };

}
