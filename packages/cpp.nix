# Compiler and tooling for C and C++
{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.libclang
    pkgs.cmake
  ];
}