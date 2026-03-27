{ pkgs, config, ... }:

{

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true; 
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
	
      shellAliases = {
        ls = "ls -h  --color=auto --group-directories-first";
	      la = "ls -a";
        ll = "ls -l";
	      c = "clear";
	      rm = "rm -iv";
	      cp = "cp -iv";
	      mv = "mv -iv";
        nix-update = "sudo nixos-rebuild switch --flake ~/nix-config#rog-strix";
        nix-test = "sudo nixos-rebuild test --flake ~/nix-config#rog-strix";
      };
      
      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = ["rm *" "pkill *" "cp *"];
      
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
