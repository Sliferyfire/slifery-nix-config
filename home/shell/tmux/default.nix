{ pkgs, config, ... }:

{

  programs.tmux = {
    enable = true;
    shortcut = "a";
    clock24 = true;
    extraConfig = ''
      unbind r 
      bind r source-file ~/.config/tmux/tmux.conf

      unbind %
      unbind '"'
      bind | split-window -h
      bind - split-window -v      
      bind -r m resize-pane -Z

      bind -r h resize-pane -L 5
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5

      set -g mouse on
      set -g default-terminal "tmux-256color"
      set -g base-index 1

      run-shell ${pkgs.tmuxPlugins.vim-tmux-navigator}/share/tmux-plugins/vim-tmux-navigator/vim-tmux-navigator.tmux

      set-option -g status-position top

      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"
      set -g @catppuccin_directory_text "#{s|^/home/sliferyfire|~|:pane_current_path}"
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right ""
      set -ag status-left "#{E:@catpuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_directory}"
      set -ag status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"

    '';
  };

}
