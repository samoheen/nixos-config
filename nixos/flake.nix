{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-25.11"; };
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, stylix, zen-browser, nixvim
    , home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      stateVersion = "25.11";
      user = "sam";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      unstable-overlays = {
        nixpkgs.overlays = [
          (final: prev: {
            unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          })
        ];
      };
      specialArgs = {
        inherit stateVersion;
        # inherit pkgs;
        inherit user;
        inherit stylix;
        inherit zen-browser;
        inherit nixvim;
      };
    in {
      nixosConfigurations = {
        zenbook = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          system = system;
          specialArgs = inputs // specialArgs;
          modules = [
            ./hosts/zenbook/configuration.nix
            unstable-overlays
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = ./home-manager/home.nix;
              home-manager.extraSpecialArgs = inputs // specialArgs;
            }
          ];
        };
      };
    };
}
