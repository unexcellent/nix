{
  system.defaults.finder = {
    # If true, the posix filepath is displayed in the window title.
    _FXShowPosixPathInTitle = false;

    # If true, all file extensions are displayed.
    AppleShowAllExtensions = true;

    # If true, hidden files are always displayed.
    AppleShowAllFiles = false;

    # If true, desktop icons are displayed.
    CreateDesktop = false;

    # If "SCcf", files are always searched in the current folder.
    FXDefaultSearchScope = "SCcf";

    # If true, a warning is displayed when a file extension is changed.
    FXEnableExtensionChangeWarning = false;

    # Change the default finder view. "icnv" = Icon view, "Nlsv" = List view, 
    # "clmv" = Column View, "Flwv" = Gallery View.
    FXPreferredViewStyle = "clmv";

    # If true, finder can be quit.
    QuitMenuItem = true;

    # If true, the path bar is displayed at the bottom of the window.
    ShowPathbar = true;

    # If true, the status bar with the disk space stats is displayed at the bottom of the window.
    ShowStatusBar = false;
  };

  # If true, the folders are always displayed on top.
  system.defaults.CustomUserPreferences."com.apple.finder"._FXSortFoldersFirst = true;
}