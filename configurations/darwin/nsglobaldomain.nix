{
  system.defaults.NSGlobalDomain = {
    # If true, the top row is permanently set as the function keys.
    "com.apple.keyboard.fnState" = false;

    # If 1, tap to click is enabled on the trackpad.
    "com.apple.mouse.tapBehavior" = 1;

    # If 1, a feedback sound is played whenever the volume is changed.
    "com.apple.sound.beep.feedback" = 0;

    # Volume level for the alert sound between 0 and 1.
    "com.apple.sound.beep.volume" = 0.0;

    # If true, folders pop open when a file is dragged over them.
    "com.apple.springing.enabled" = null;
    
    # Delay for spring loading in seconds.
    "com.apple.springing.delay" = 1.0;

    # If true, "natural" scrolling direction is enabled.
    "com.apple.swipescrolldirection" = true;

    # If true, secondary (right) click is enabled on the touchpad.
    "com.apple.trackpad.enableSecondaryClick" = true;

    # If true, force click is enabled on the touchpad.
    "com.apple.trackpad.forceClick" = false;

    # Scaling factor of the trackpad tracking speed (between 0 and 3).
    "com.apple.trackpad.scaling" = 1.0;

    # If 1, the trackpad corner acts as the secondary (right) click.
    "com.apple.trackpad.trackpadCornerClickBehavior" = null;
    
    # If true, the menu bar is automatically hidden
    _HIHideMenuBar = false;

    # If true, swiping left or right on the touchpad acts as forwards and backwards on the magic 
    # mouse.
    AppleEnableMouseSwipeNavigateWithScrolls = true;

    # If true, swiping left or right on the touchpad acts as forwards and backwards on the 
    # trackpad.
    AppleEnableSwipeNavigateWithScrolls = true;
    
    # Sets the sub-pixel font rendering (options: null, 0, 1, 2).
    AppleFontSmoothing = null;
    
    # If true, 24 hour clock format is forced regardless of region.
    AppleICUForce24HourTime = true;

    # The display mode of the OS (options: null or "Dark").
    AppleInterfaceStyle = "Dark";

    # If true, the UI switches between light and dark based on time of day.
    AppleInterfaceStyleSwitchesAutomatically = false;

    # If 3, full keyboard control is enabled (options: null, 3).
    AppleKeyboardUIMode = 3;

    # Set the measurement unit regardless of region (option: null, "Centimeters", "Inches").
    AppleMeasurementUnits = "Centimeters";

    # Whether to use the metric system regardless of region (options: null, 0, 1).
    AppleMetricUnits = 1;

    # If true, press-and-hold feature is enabled.
    ApplePressAndHoldEnabled = false;

    # If true, file extensions are always displayed in Finder.
    AppleShowAllExtensions = true;

    # If true, hidden files are always displayed.
    AppleShowAllFiles = false;

    # Set when the scroll bar should be displayed (options: "WhenScrolling", "Automatic", "Always")
    AppleShowScrollBars = "WhenScrolling";

    # If true, the page jumps to the spot clicked on the scroll bar.
    AppleScrollerPagingBehavior = true;

    # Set the temperature unit (options: "Celsius", "Fahrenheit").
    AppleTemperatureUnit = "Celsius";

    # Sets the window tabbing when opening a new document (options: "manual", "always", "fullscreen").
    AppleWindowTabbingMode = "always";

    # If you press and hold certain keyboard keys when in a text area, the key’s character begins 
    # to repeat. For example, the Delete key continues to remove text for as long as you hold it 
    # down. This sets how long you must hold down the key before it starts repeating 
    # (options: 120, 94, 68, 35, 25, 15).
    InitialKeyRepeat = 15;

    # If you press and hold certain keyboard keys when in a text area, the key’s character begins 
    # to repeat. For example, the Delete key continues to remove text for as long as you hold it 
    # down. This sets how fast it repeats once it starts (options: 120, 90, 60, 30, 12, 6, 2).
    KeyRepeat = 2;

    # If true, words are automatically capitalized.
    NSAutomaticCapitalizationEnabled = false;

    # If true, dashes are automatically substituted based on context.
    NSAutomaticDashSubstitutionEnabled = false;

    # If true, text is automatically predicted inline.
    NSAutomaticInlinePredictionEnabled = false;

    # If true, periods are automatically substituted based on context.
    NSAutomaticPeriodSubstitutionEnabled = false;

    # If true, quotation marks are automatically substituted based on context.
    NSAutomaticQuoteSubstitutionEnabled = false;

    # If true, spelling is automatically corrected.
    NSAutomaticSpellingCorrectionEnabled = false;

    # If true, windows and popovers are animated during opening and closing.
    NSAutomaticWindowAnimationsEnabled = true;

    # If true, inactive apps are automatically terminated.
    NSDisableAutomaticTermination = false;

    # If true, documents are automatically saved to iCloud.
    NSDocumentSaveNewDocumentsToCloud = false;

    # If true, the save window is always opened in expanded mode.
    NSNavPanelExpandedStateForSaveMode = true;
    NSNavPanelExpandedStateForSaveMode2 = true;

    # It true, smooth scrolling is enabled.
    NSScrollAnimationEnabled = true;

    # Sets the size of the finder sidebar icons: 1 (small), 2 (medium) or 3 (large).
    NSTableViewDefaultSizeMode = 2;

    # If true, ASCII control characters are displayed using caret notation in standard text views.
    NSTextShowsControlCharacters = false;

    # If true, focus ring animation is enabled.
    NSUseAnimatedFocusRing = true;

    # Sets the window resizing speed.
    NSWindowResizeTime = 2.0e-2;

    # If true, windows can be dragged by holding anywhere (like on linux).
    NSWindowShouldDragOnGesture = null;

    # If true, the print window is always opened in expanded mode.
    PMPrintingExpandedStateForPrint = true;
    PMPrintingExpandedStateForPrint2 = true;
  };
}