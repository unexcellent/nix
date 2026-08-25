# Packages for ESP programming
{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.espup
    pkgs.esp-generate
    pkgs.espflash
  ];
}
