# A terminal application
{
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.kitty = {
        enable = true;
        settings = {
          window_padding_width = 4;
          font_family = "menlo";
          font_size = 14.0;
          macos_option_as_alt = "left";
          confirm_os_window_close = 0;
        };
        themeFile = "Github_Dark";
      };
    }
  ];
}
