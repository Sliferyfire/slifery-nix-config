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
        update = "sudo nixos-rebuild switch";
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
