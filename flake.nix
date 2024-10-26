{

  description = "My Nixos configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
  let

      system = "x86_64-linux";

      username = "n";

      hostname = "0N";

      flakedir = "~/nixos-config";

      systemver = "24.05";

      pkgs-stable = import nixpkgs-stable {
        config.allowUnfree = true;
        inherit system;
      };

  in {

    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {

        inherit system;

        specialArgs = { 
			    inherit system;
			    inherit username;
			    inherit hostname;
			    inherit systemver;
			    inherit pkgs-stable;
			  };

        modules = [ ./desktop ];
        
      };
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {

      pkgs = nixpkgs.legacyPackages.${system};

      extraSpecialArgs = {
			  inherit username;
			  inherit flakedir;
			  inherit systemver;
			};

      modules = [ ./desktop/home.nix ];

    };

  };

}
