# Git hooks for ensuring preventing bad quality code from even being committed.
{pkgs, ...}: {
  environment.systemPackages = [ pkgs.pre-commit ];
}