# Headless server behavior
{ pkgs, username, ... }: {
  networking = {
    hostName = "eos";
    computerName = "eos";
    localHostName = "eos";
  };

  # Remote Login so the server is reachable via SSH
  services.openssh.enable = true;

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
  homebrew.brews = [ "tailscale" ];
}
