{ pkgs, config, ... }:

{

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "you-should-use";
          src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
        }
      ];

      shellAliases = {
        # Daily use aliases
        ls = "ls -h  --color=auto --group-directories-first";
        la = "ls -a";
        ll = "ls -l";
        c = "clear";
        rm = "rm -iv";
        cp = "cp -iv";
        mv = "mv -iv";

        # Nixos aliases
        nix-update = "sudo nixos-rebuild switch --flake ~/nix-config#rog-strix";
        nix-test = "sudo nixos-rebuild test --flake ~/nix-config#rog-strix";

        # Tmux aliases
        tn = "tmux new -s";
        ta = "tmux attach -t";
        td = "tmux detach";
        tl = "tmux ls";
        tk = "tmux kill-session -t";
        tka = "tmux kill-server";
        tx = "tmux attach";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "npm"
        ];
      };

    };
  };

}
