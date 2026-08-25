# Start the podman machine (the Linux VM backing podman) at boot, without
# anyone logging in, and restart it if it ever stops. Runs as the admin user
# because the VM and its connection config live in the user's home.
# One-time setup per machine: `podman machine init` as the admin user.
{ username, ... }: {
  # Rosetta (x86_64 emulation inside the VM) must stay off: on first boot the
  # machine tries to download/install Rosetta, which needs a GUI session and
  # hangs forever on this headless machine - the VM then never boots.
  # Takes effect at `podman machine init` time.
  home-manager.sharedModules = [
    {
      xdg.configFile."containers/containers.conf".text = ''
        [machine]
        rosetta = false
      '';
    }
  ];

  launchd.daemons.podman-machine = {
    script = ''
      podman=/run/current-system/sw/bin/podman
      # Only start from a clean "stopped" state; never pile onto a start that
      # is already in progress ("starting"), e.g. one triggered manually.
      if [ "$($podman machine inspect --format '{{.State}}' 2>/dev/null)" = "stopped" ]; then
        $podman machine start
      fi
    '';
    serviceConfig = {
      UserName = username;
      RunAtLoad = true;
      StartInterval = 300;
      EnvironmentVariables.HOME = "/Users/${username}";
      StandardOutPath = "/tmp/org.nixos.podman-machine.log";
      StandardErrorPath = "/tmp/org.nixos.podman-machine.log";
    };
  };
}
