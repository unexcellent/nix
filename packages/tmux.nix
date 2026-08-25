# Terminal multiplexer
{
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.tmux = {
        enable = true;
        escapeTime = 0;
        prefix = "§";
      };
    }
  ];
}
