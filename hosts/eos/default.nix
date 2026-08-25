# Configuration of the Mac Studio server
{ username, lib, pkgs, home-manager, ... }: {
  imports = [
    ./home-manager.nix
    ./packages.nix
    ./server.nix
    ./user-space.nix
  ];
}
