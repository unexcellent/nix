# Configuration of the Mac Studio server
{ username, lib, pkgs, home-manager, ... }: {
  imports = [
    ./home-manager.nix
    ./packages.nix
    ./podman.nix
    ./server.nix
    ./starship.nix
    ./user-space.nix
    ./users.nix
  ];
}
