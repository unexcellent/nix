# Description
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.yabai ];

  home-manager.sharedModules = [
    {
      nixpkgs.config.allowUnfree = true;

      services.skhd = {
        enable = true;
        package = pkgs.skhd;
      };

    }
  ];
}
