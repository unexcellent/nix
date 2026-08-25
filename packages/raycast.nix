# A better alternative to spotlight
{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.raycast ];
}

