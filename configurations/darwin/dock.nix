{
  system.defaults.dock = {
    # If true, the appswitcher is displayed on all displays and not only on the main one.
    appswitcher-all-displays = true;

    # It true, the dock hides when the mouse is not hovering on it.
    autohide = true;

    # Delay between the mouse leaving the dock area and the dock hiding.
    autohide-delay = 0.0;

    # Speed of the dock autohide animation.
    autohide-time-modifier = 0.15;

    # If true, the dashboard is hidden from the dock.
    dashboard-in-overlay = true;

    # If true, apps can be opened when items are dragged over them.
    enable-spring-load-actions-on-all-items = true;

    # Speed of the mission control animations.
    expose-animation-duration = 0.2;

    # If true, windows are grouped by apps in mission control.
    expose-group-apps = false;

    # Jumping animation when opening apps from dock.
    launchanim = true;

    # Magnify icons on hover.
    magnification = true;

    # Effect when minimizing apps (options: "genie", "suck", "scale").
    mineffect = "scale";

    # If true, apps are minimized into the dock icon.
    minimize-to-application = true;

    # Enable highlight hover effect for the grid view of a stack in the Dock.
    mouse-over-hilite-stack = true;

    # If true, spaces are rearranged based on most recent use.
    mru-spaces = false;

    # Position of the dock relative to the screen (options: "bottom", "left", "right")
    orientation = "bottom";

    # Persistent folders in the dock.
    persistent-others = [ ];

    # If true, process indicators are displayed in dock.
    show-process-indicators = true;

    # If true, recent apps are shown in dock.
    show-recents = false;

    # If true, icons of hidden apps are translucent.
    showhidden = true;

    # If true, only open apps are shown in dock.
    static-only = false;

    # Size of the icons in the dock.
    tilesize = 1;

    # Hot corner actions. Options:
    # 1: Disabled
    # 2: Mission Control
    # 3: Application Windows
    # 4: Desktop
    # 5: Start Screen Saver
    # 6: Disable Screen Saver
    # 7: Dashboard
    # 10: Put Display to Sleep
    # 11: Launchpad
    # 12: Notification Center
    # 13: Lock Screen
    # 14: Quick Note
    wvous-bl-corner = 1; # bottom left
    wvous-br-corner = 1; # bottom right
    wvous-tl-corner = 1; # top left
    wvous-tr-corner = 1; # top right
  };
}

