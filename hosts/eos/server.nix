# Headless server behavior
{ pkgs, username, lib, ... }: {
  # Clients connect with all kinds of TERM values (e.g. ghostty's
  # xterm-ghostty) that macOS has no terminfo for, which cripples the line
  # editor. Force a universally known terminal instead (same approach as the
  # fish config in nix-pi).
  home-manager.sharedModules = [
    {
      programs.fish.interactiveShellInit = lib.mkBefore ''
        set -gx TERM xterm-256color
        set -gx COLORTERM truecolor
      '';
      programs.zsh.initContent = lib.mkBefore ''
        export TERM=xterm-256color
        export COLORTERM=truecolor
      '';
    }
  ];

  networking = {
    hostName = "eos";
    computerName = "eos";
    localHostName = "eos";
  };

  # Remote Login so the server is reachable via SSH
  services.openssh.enable = true;

  # Never let macOS install updates (and reboot) on its own; updates are
  # applied manually when someone can recover the machine if it hangs.
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

  # Stay awake and come back on our own after a power failure
  power = {
    restartAfterPowerFailure = true;
    sleep = {
      computer = "never";
      display = 10;
      harddisk = 10;
    };
  };

  # Tailscale was installed via Homebrew before nix managed this machine;
  # declaring it here keeps `brew` from treating it as an orphan.
  # It must run as a boot-persistent root daemon (once, manually):
  #   sudo brew services start tailscale
  homebrew.brews = [ "tailscale" ];

  # Watchdog: if tailscaled ever dies (and launchd's KeepAlive did not bring
  # it back), restart it so the machine stays reachable remotely. sshd on the
  # LAN remains the independent fallback path.
  launchd.daemons.tailscale-watchdog = {
    script = ''
      if ! /usr/bin/pgrep -qx tailscaled; then
        /bin/launchctl kickstart system/homebrew.mxcl.tailscale 2>/dev/null \
          || /opt/homebrew/bin/brew services start tailscale
      fi
    '';
    serviceConfig = {
      RunAtLoad = true;
      StartInterval = 300;
    };
  };
}
