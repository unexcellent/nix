# Description
{ pkgs, ... }: {
  home-manager.sharedModules = [
    {
      programs. = {     # installation via home-manager
        enable = true;
      };
    }
  ];
  environment.systemPackages = [ pkgs. ]; # installation via nix
  homebrew.masApps = {                    # installation via Mac Appstore

  };
}