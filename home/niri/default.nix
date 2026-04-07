{ config, pkgs, inputs, ... }:

{

  # imports = [inputs.niri.homeModules.niri];

  programs.niri = {
    package = pkgs.niri;
    # enable = true; 
    settings = {
      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; } 
      ];

      environment = {
        DISPLAY = ":0";
      };
      
      input = {
        keyboard.xkb = {
          layout = "latam,us";
        };

        touchpad = {
          natural-scroll = false;
          tap = false;
        };

        mouse = {
          accel-profile = "flat";
        };
      };

      layout = {
        gaps = 8; 

        border = {
          enable = true;
          width = 2;
          active.gradient = {
            from = "#cba6f7";
            to = "#f5c2e7";
            angle = 45;
            relative-to = "workspace-view";
          };
          inactive.color = "#313244";
        };

      };
      
      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "alacritty";
        "Mod+B".action = spawn "firefox"; 
        "Mod+E".action = spawn "dolphin";

        "Mod+A".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
        "Mod+Shift+W".action.spawn = [ "noctalia-shell" "ipc" "call" "wallpaper" "toggle" ];
        "Mod+P".action.spawn = [ "noctalia-shell" "ipc" "call" "sessionMenu" "toggle" ];
        "Mod+R".action.spawn = [ "noctalia-shell" "ipc" "call" "controlCenter" "toggle" ];

        "Mod+Q".action = close-window;
        "Mod+Shift+E".action = quit;
        "Mod+Space".action = switch-layout "next";
        "Mod+Shift+Slash".action = show-hotkey-overlay;

        "Mod+F".action = maximize-column;
        "Mod+G".action = fullscreen-window;
        "Mod+Shift+F".action = toggle-window-floating;
        "Mod+C".action = center-column;

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+K".action = focus-window-up;
        "Mod+J".action = focus-window-down;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+Down".action = focus-window-down;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-window-up;
        "Mod+Shift+J".action = move-window-down;

        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Up".action = move-window-up;
        "Mod+Shift+Down".action = move-window-down;

        "Mod+Ctrl+H".action = set-column-width "-5%";
        "Mod+Ctrl+L".action = set-column-width "+5%";
        "Mod+Ctrl+J".action = set-window-height "-5%";
        "Mod+Ctrl+K".action = set-window-height "+5%";

        "Mod+Shift+Page_Down".action = move-column-to-workspace-down;
        "Mod+Shift+Page_Up".action = move-column-to-workspace-up;
        "Mod+Shift+WheelScrollDown".action = move-column-to-workspace-down;
        "Mod+Shift+WheelScrollUp".action = move-column-to-workspace-up;

        "Mod+WheelScrollDown".action = focus-column-left;
        "Mod+WheelScrollUp".action = focus-column-right;
        "Mod+Ctrl+WheelScrollDown".action = focus-workspace-down;
        "Mod+Ctrl+WheelScrollUp".action = focus-workspace-up; 
        
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        "XF86AudioRaiseVolume".action = spawn "sh" "-c" "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume".action = spawn "sh" "-c" "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
        "XF86AudioMicMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
        "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "5%+" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];

        "XF86AudioPlay".action.spawn = [ "playerctl" "play" ];
        "XF86AudioStop".action.spawn = [ "playerctl" "pause" ];
        "XF86AudioNext".action.spawn = [ "playerctl" "next" ];
        "XF86AudioPrev".action.spawn = [ "playerctl" "previous" ];

        # Plugin clipper
        "Mod+V".action.spawn = [ "noctalia-shell" "ipc" "call" "plugin:clipper" "toggle" ];
        "Mod+Shift+C".action.spawn = [ "noctalia-shell" "ipc" "call" "plugin:clipper" "addSelectionToTodo" ];
        "Mod+Shift+X".action.spawn = [ "noctalia-shell" "ipc" "call" "plugin:clipper" "addSelectionToNoteCard" ]; 
      };

    };
    

  };

  home.packages = with pkgs; [
    fuzzel
    xwayland
    alacritty
    brightnessctl
    playerctl
    inputs.noctalia-qs.packages.${pkgs.system}.default
  ];

}
