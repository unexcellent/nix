# Configuration of the /user directory
{ lib, pkgs, home-manager, ... }: {
  system.activationScripts.text = ''
    ${builtins.readFile (../../scripts/set_up_user_space.sh)}
    ${builtins.readFile (../../scripts/set_up_apps_dir.sh)}
    ${builtins.readFile (../../scripts/set_up_config_dir.sh)}
    ${builtins.readFile (../../scripts/set_up_dev_dir.sh)}
  '';
}
