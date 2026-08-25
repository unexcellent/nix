# Terminal multiplexer
{
  pkgs,
  username,
  ...
}: {
  home-manager.users."${username}".programs.tmux = {
    enable = true;
    escapeTime = 0;
    prefix = "§";
  };
}
