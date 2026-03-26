{config, ...}: 

{

  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    
    settings = {
      line_break = {
        disabled = true;
      };

      add_newline = true;

      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };

      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
        read_only = " ";
      };

      # Indicadores de git
      git_branch = {
        symbol = " ";
        style = "bold purple";
      };
      git_status = {
        style = "bold red";
      };

      nix_shell = {
        symbol = " ";
        heuristic = true;
      };

      # Indicadores de lenguajes/entornos
      nodejs = {
        symbol = " ";
        style = "bold green";
      };
      php = {
        symbol = " ";
        style = "bold blue";
      };
      dart = {
        symbol = " ";
        style = "bold blue";
      };

    };
  };

}
