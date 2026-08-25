# Video Conference App
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.zoom-us ];
}