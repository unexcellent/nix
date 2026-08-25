# The installed packages / scripts on this system
{ pkgs, home-manager, ... }: 
let
  package_dir = ../../packages;
in {
  # To install a package, first create a .nix file in the packages dir (you can use the template).
  # Then add the file to this list.
  imports = [
    "${package_dir}/alacritty.nix"
    "${package_dir}/bitwarden.nix"
    "${package_dir}/calc.nix"
    "${package_dir}/git.nix"
    "${package_dir}/helix.nix"
    "${package_dir}/jiggler.nix"
    "${package_dir}/nixup.nix"
    "${package_dir}/precommit.nix"
    "${package_dir}/python.nix"
    "${package_dir}/raycast.nix"
    "${package_dir}/rust.nix"
    "${package_dir}/starship.nix"
    "${package_dir}/vscode.nix"
    "${package_dir}/zsh.nix"
  ];
}
