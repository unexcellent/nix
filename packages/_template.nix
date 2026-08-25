# Description
{ pkgs, username, ... }: {
  home-manager.users."${username}".programs. = {     # installation via home-manager
    enable = true;
  };
  environment.systemPackages = [ pkgs. ]; # installation via nix
  homebrew.masApps = {                    # installation via Mac Appstore
    
  };
}