# Configuration of my private MacBook
{ username, lib, pkgs, home-manager, ... }: {
  imports = [
    ./dock.nix
    ./home-manager.nix
    ./packages.nix
    ./user-space.nix
  ];
}
