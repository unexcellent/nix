{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/e2587caef70cea85dd97d7daab492899902dbf5d";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    nix-homebrew,
    homebrew-bundle,
    homebrew-core,
    homebrew-cask,
    nixvim,
    ...
  }: let
    # username is the folder name in /Users/ on that host
    mkHost = host: username:
      darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs =
          inputs
          // {
            inherit username;
          };

        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
          ./configurations/darwin
          ./hosts/${host}
        ];
      };
  in {
    darwinConfigurations = {
      atlas = mkHost "atlas" "tk";
      kronos = mkHost "kronos" "tk";
      eos = mkHost "eos" "admin";
    };
  };
}
