{ pkgs, ... }:

let
  font = "JetBrainsMono Nerd Font";
in
{
  home.sessionVariables = {
    WINIT_UNIX_BACKEND = "wayland";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      window.decorations = "None";
      window.dynamic_padding = true;
      window.padding = {
        x = 10;
        y = 10;
      };
      window.blur = true;
      # window.startup_mode = "Maximized";
      scrolling.history = 10000;

      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 14;
      };

      colors = (builtins.fromTOML (builtins.readFile ./catppuccin-mocha.toml)).colors;

    };
  };

}
