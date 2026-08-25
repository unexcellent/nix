# Description
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.slack ];
}
