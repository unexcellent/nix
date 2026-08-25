# Library for building 3D models
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.opencascade-occt ];
}