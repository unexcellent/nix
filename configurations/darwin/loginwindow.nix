{ username, ... }: {
  system.defaults.loginwindow = {
    # If true, console access in the login window is disabled.
    DisableConsoleAccess = true;

    # If true, users can log into the machine using a guest account.
    GuestEnabled = false;

    # Text that should be displayed on the login window. Default is "\\U03bb"
    LoginwindowText = "";

    # If true, the power off menu item will be disabled when user is logged in.
    PowerOffDisabledWhileLoggedIn = false;

    # If true, the restart button is hidden on the login screen.
    RestartDisabled = false;

    # If true, the "restart" option is disabled while a user is logged in.
    RestartDisabledWhileLoggedIn = false;

    # If true, the users are displayed as a name and password field instead of a list of users.
    SHOWFULLNAME = false;

    # If true, the shutdown button is disabled on the login screen.
    ShutDownDisabled = false;

    # If true, the "shutdown" option is disabled when the user is logged in.
    ShutDownDisabledWhileLoggedIn = false;

    # If true, the sleep button is diabled on the login screen.
    SleepDisabled = false;

    # User that should automatically be selected for login.
    autoLoginUser = "${username}";
  };

  # If true, the system plays a sound while booting up.
  system.startup.chime = false;
}
