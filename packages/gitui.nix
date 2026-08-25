# A git interface for the terminal.
{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = [pkgs.gitui];
}
