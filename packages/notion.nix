# Note taking app
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.notion-app ]; # installation via nix
}
