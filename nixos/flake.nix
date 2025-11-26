{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }: let
      system = "x86_64-linux";
      stateVersion = "25.05";
      user = "sam";
      hosts = [
        { hostName = "zenbook"; }
      ];

      makeSystem = { hostName }: nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostName user;
        };
        modules = [
          ./hosts/${hostName}/configuration.nix

          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            home-manager.users.${user} = import ./home-manager/home.nix;

            home-manager.extraSpecialArgs = {
              inherit inputs stateVersion user;
            };
          }
        ];
      };

    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostName}" = makeSystem {
            inherit (host) hostName;
          };
        }) {} hosts;
    };
}
