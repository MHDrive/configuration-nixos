{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-23.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-22.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-stable, nixpkgs-23, nixpkgs-22, home-manager, ... }: {
    nixosConfigurations = {
      nixos-mh = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          pkgs-23 = import nixpkgs-23 {
            inherit system;
            config.allowUnfree = true;
          };
          pkgs-22 = import nixpkgs-22 {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./modules
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mh = import ./home-manager;
          }
        ];
      };
    };
  };
}