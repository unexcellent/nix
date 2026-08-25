# The installed packages / scripts on this system
{
  pkgs,
  home-manager,
  ...
}: let
  package_dir = ../../packages;
in {
  # To install a package, first create a .nix file in the packages dir (you can use the template).
  # Then add the file to this list.
  imports = [
    "${package_dir}/claude.nix"
    "${package_dir}/dev.nix"
    "${package_dir}/fish.nix"
    "${package_dir}/git.nix"
    "${package_dir}/gitui.nix"
    "${package_dir}/helix.nix"
    "${package_dir}/ls.nix"
    "${package_dir}/nixup.nix"
    "${package_dir}/podman.nix"
    "${package_dir}/python.nix"
    "${package_dir}/starship.nix"
    "${package_dir}/tree.nix"
    "${package_dir}/user-brew.nix"
    "${package_dir}/zellij.nix"
    "${package_dir}/zsh.nix"
  ];
}
