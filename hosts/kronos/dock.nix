{ pkgs, home-manager, ... }: let
  app_dir = "/user/apps";
in {
  # Apps to be shown in the dock
  # By default all apps are symlinked to the /user/apps directoy so they can be imported from there.
  system.defaults.dock.persistent-apps = [
    "${app_dir}/Google Chrome.app"
    "${app_dir}/Microsoft Outlook.app"
    "${app_dir}/Microsoft Teams.app"
    "${app_dir}/Visual Studio Code.app"
    "${app_dir}/Alacritty.app"
    "${app_dir}/Microsoft PowerPoint.app"
    "${app_dir}/Microsoft Excel.app"
    "${app_dir}/System Settings.app"
  ];
}