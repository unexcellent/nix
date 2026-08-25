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
    # "${package_dir}/bitwarden.nix"  # apps from mac app store only need to be installed once
    "${package_dir}/aerospace.nix"
    "${package_dir}/arduino.nix"
    "${package_dir}/brave.nix"
    "${package_dir}/bundle-code.nix"
    "${package_dir}/calc.nix"
    "${package_dir}/claude.nix"
    "${package_dir}/cpp.nix"
    "${package_dir}/dev.nix"
    "${package_dir}/docker.nix"
    "${package_dir}/esp.nix"
    # "${package_dir}/excel.nix"      # apps from mac app store only need to be installed once
    "${package_dir}/firefox.nix"
    "${package_dir}/fish.nix"
    "${package_dir}/git.nix"
    # "${package_dir}/github.nix"
    "${package_dir}/gitui.nix"
    "${package_dir}/ghostty.nix"
    "${package_dir}/helix.nix"
    "${package_dir}/javascript.nix"
    "${package_dir}/jiggler.nix"
    "${package_dir}/ls.nix"
    "${package_dir}/nixup.nix"
    "${package_dir}/notion.nix"
    "${package_dir}/obsidian.nix"
    "${package_dir}/plantuml.nix"
    # "${package_dir}/powerpoint.nix" # apps from mac app store only need to be installed once
    "${package_dir}/precommit.nix"
    "${package_dir}/protobuf.nix"
    "${package_dir}/proton.nix"
    "${package_dir}/python.nix"
    "${package_dir}/raycast.nix"
    "${package_dir}/rust.nix"
    "${package_dir}/slack.nix"
    "${package_dir}/starship.nix"
    "${package_dir}/tree.nix"
    "${package_dir}/typst.nix"
    "${package_dir}/vscode.nix"
    "${package_dir}/whatsapp.nix"
    # "${package_dir}/word.nix"       # apps from mac app store only need to be installed once
    "${package_dir}/zellij.nix"
    "${package_dir}/zephyr.nix"
    "${package_dir}/zsh.nix"
  ];
}
