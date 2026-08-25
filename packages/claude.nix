# Claude coding agent
{pkgs, ...}: {
  environment.systemPackages = [pkgs.claude-code];
}
