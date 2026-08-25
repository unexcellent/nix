# Run the python cProfiler, sort the output by total time and only output the first 100 lines
{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "pyprofile" ''
      #!/usr/bin/env bash

      # Run the python cProfiler, sort the output by total time and only output the first 100 lines
      # Usage:
      # pyprofile path/to/the/script.py

      python -m cProfile -s tottime "$1" | head -n 100
    '')
  ];
}