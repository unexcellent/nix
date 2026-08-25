# A terminal calculator
{pkgs, ...}: {
  environment.systemPackages = [ pkgs.calc ];
}