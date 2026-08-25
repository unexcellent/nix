{pkgs, ...}: {
  system.defaults.menuExtraClock = {
    # If true, an analog clock is displayed in the menu bar.
    IsAnalog = false;

    # If true, the clock is displayed in a 24 hour format.
    Show24Hour = true;

    # If true, the am/pm label is displayed in the menu bar.
    ShowAMPM = false;

    # Show the full date in the menu bar 0 = When space allows, 1 = Always, 2 = Never.
    ShowDate = 0;

    # If true, the day of the month is shown in the menu bar.
    ShowDayOfMonth = null;

    # If true, the day of the week is shown in the menu bar.
    ShowDayOfWeek = null;

    # If true, the seconds are shown in the menu bar.
    ShowSeconds = true;
  };

  # If true, the battery percentage will be shown in the menu bar
  system.defaults.CustomUserPreferences."com.apple.controlcenter.plist".BatteryShowPercentage = true;
}