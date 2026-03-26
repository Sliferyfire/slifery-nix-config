
{

  # Enable and configure git 
  programs.git = {
    enable = true;

    settings = {
      user = {
	    name = "Sliferyfire";
	    email = "sliferyfire@gmail.com";
    };

      init = {
	      defaultBranch = "main";
      };
       
      pull = { rebase = true; };

    };
  };

}
