# The GNU compiler collection
{pkgs, ...}: {
  environment.systemPackages = [ pkgs.libgccjit ];
}