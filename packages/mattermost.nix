# The Mattermost Communication Tool
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.mattermost-desktop ];
}
