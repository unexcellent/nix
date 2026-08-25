# The node package manager
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.nodejs_24 pkgs.bun ];
}
