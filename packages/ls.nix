# Terminal command for listing contents of directories
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.eza ];
  
  home-manager.users."${username}".home.shellAliases = {
    ls = "eza -1a --group-directories-first";
  };
}
