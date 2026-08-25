# PlantUML - compile diagrams from plain-text .puml files
# The nixpkgs package bundles a JRE and Graphviz, so it can render on its own.
{pkgs, ...}: {
  environment.systemPackages = [pkgs.plantuml];
}
