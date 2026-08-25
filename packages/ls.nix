# Terminal command for listing contents of directories
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.eza ];

  home-manager.sharedModules = [
    {
      home.shellAliases = {
        ls = "eza -1a --group-directories-first";
      };
    }
  ];
}
