{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs: let
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
        ];
      };

    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostName}" = makeSystem {
            inherit (host) hostName;
          };
        }) {} hosts;

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs stateVersion user;
        };
       
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}
