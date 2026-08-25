# Description
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.yabai ];

  home-manager.users."${username}" = {
    nixpkgs.config.allowUnfree = true;

    services.skhd = {
      enable = true;
      package = pkgs.skhd;
    };

  };
}
