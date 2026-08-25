# A script of updating to a newer configuration
{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "nixup" ''
      #!/usr/bin/env bash
      git add .;
      nix --extra-experimental-features 'nix-command flakes' build .#darwinConfigurations.$1.system;
      sudo result/sw/bin/darwin-rebuild switch --flake .#$1
    '')
  ];
}