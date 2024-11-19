{
  description = "My NixOS and Home Manager configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.viktoreeej = import ./home.nix;
            };
          }
        ];
      };

      homeConfigurations.viktoreeej = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [ 
          ./home.nix
          {
            home = {
              username = "viktoreeej";
              homeDirectory = "/home/viktoreeej";
            };
          }
        ];
      };
    };
}