# The whatsapp instant messenger
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.whatsapp-for-mac ];
}