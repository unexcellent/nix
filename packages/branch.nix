# Create a git branch and check it out 
{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "branch" ''
      #!/usr/bin/env bash
      git branch $1;
      git checkout $1;
    '')
  ];
}