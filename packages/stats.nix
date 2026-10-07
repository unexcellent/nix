# Shows CPU, memory and network usage in the menu bar
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.stats ];

  system.defaults.CustomUserPreferences."eu.exelban.Stats" = {
    # Skips the onboarding dialog on first launch
    setupProcess = true;

    CPU_state = true;
    CPU_widget = "mini";
    RAM_state = true;
    RAM_widget = "mini";
    Network_state = false;
    Network_widget = "speed";
    Disk_state = false;
    Disk_widget = "bar_chart";

    Battery_state = false;
    Bluetooth_state = false;
    Clock_state = false;
    GPU_state = false;
    Sensors_state = false;
  };
}
