{
  description = "My NixOs Configurations For Desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher.url = "github:Diegiwg/PrismLauncher-Cracked"
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }:
  let
    hostName = "0N";
    userName = "n";

    systemVersion = "25.05";
    homeVersion = "25.05";

    timeZone = "Turkey";

    system = "x86_64-linux";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.strawberry = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit hostName userName systemVersion timeZone pkgs-stable prismlauncher;
      };

      modules = [
        ./strawberry/packages
        ./strawberry/system

        /etc/nixos/hardware-configuration.nix
      ];
    };

    homeConfigurations.strawberry = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit userName homeVersion pkgs-stable;
      };

      pkgs = nixpkgs.legacyPackages.${system};
      
      modules = [
        ./strawberry/home.nix
      ];
    };
  };
}
