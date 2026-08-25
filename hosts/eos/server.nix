# Headless server behavior
{ pkgs, username, ... }: {
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
