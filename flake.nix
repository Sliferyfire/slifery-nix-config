{
  description = "Configuración Modular";

  # ----- INPUTS -----

  # System Inputs
  inputs = {
    # Primary channels
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NVF (Neovim framework)
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Niri Window manager 
    niri.url = "github:sodiboo/niri-flake";

    # Noctalia shell (Wayland desktop shell + launcher)
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    
    # Spicetify 
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # ----- OUTPUTS -----

  # System outputs
  outputs = { self, nixpkgs, home-manager, nvf, niri, noctalia, spicetify-nix, ... }@inputs: {

    nixosConfigurations = {

      rog-strix = let
        username = "sliferyfire";
        specialArgs = { inherit username; };
      in 
        nixpkgs.lib.nixosSystem {
    	    inherit specialArgs;
	        system = "x86_64-linux";
	        modules = [
	          nvf.nixosModules.default
            niri.nixosModules.niri
 	          ./hosts/laptop

	          # Home manager 
	          home-manager.nixosModules.home-manager
	          {
	            home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
	            home-manager.extraSpecialArgs = { inherit inputs username; };
	            home-manager.users.${username} = import ./users/${username}/home.nix;
              home-manager.backupFileExtension = "backup";
	          }
	        ];
        };

    };

  };
}
