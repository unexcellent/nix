{
  pkgs,
  home-manager,
  ...
}: let
  app_dir = "/user/apps";
in {
  # Apps to be shown in the dock
  # By default all apps are symlinked to the /user/apps directoy so they can be imported from there.
  system.defaults.dock.persistent-apps = [
    "${app_dir}/Firefox.app"
    "${app_dir}/Proton Mail.app"
    "${app_dir}/Visual Studio Code.app"
    "${app_dir}/Obsidian.app"
    "${app_dir}/kitty.app"
    "${app_dir}/Microsoft PowerPoint.app"
    "${app_dir}/Microsoft Excel.app"
    "${app_dir}/System Settings.app"
  ];
}
