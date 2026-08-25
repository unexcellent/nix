# How to set up

1. Install xcode via `xcode-select --install`
2. Install Lix via `curl -sSf -L https://install.lix.systems/lix | sh -s -- install`
3. Create an set up an ssh key on Github like described [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. Reboot
5. Download nix-darwin config
6. `cd` into `~/Downloads/nix-darwin-main`
7. Execute commands described in `/packages/nixup.nix`
8. Reboot

# eos (Mac Studio server)

## Bootstrap over SSH (no monitor needed)

Precondition: the machine already has Homebrew + tailscale and you can SSH in.
The macOS account must have the short name `admin` (it is `system.primaryUser`
and owns the system Homebrew) — if it doesn't, change the username in the
`eos = mkHost "eos" "admin";` line of `flake.nix` instead.

1. Secure your access before touching anything (see "Not getting locked out"
   below): `fdesetup status` must say FileVault is Off, and
   `sudo brew services start tailscale` must be registered so tailscaled
   survives reboots.
2. Command line tools are already present if Homebrew works
   (check `xcode-select -p`).
3. Install nix (Lix): `curl -sSf -L https://install.lix.systems/lix | sh -s -- install --no-confirm`
4. Log out and back in (new SSH session) so `nix` is on the PATH.
5. Set up a GitHub ssh key (see step 3 above) and clone this repo:
   `mkdir -p ~/user/config && git clone git@github.com:unexcellent/nix-darwin.git ~/user/config/nix-darwin`
6. First build and switch (later rebuilds just use `nixup eos`):
   ```
   cd ~/user/config/nix-darwin
   nix --extra-experimental-features 'nix-command flakes' build .#darwinConfigurations.eos.system
   sudo ./result/sw/bin/darwin-rebuild switch --flake .#eos
   ```
   If the switch complains about existing files (e.g. `/etc/nix/nix.conf`),
   move each aside as the error message instructs
   (`sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin`) and re-run.
7. Reboot when convenient (the `/user` symlink needs it) — but only when you
   can afford the machine not coming back up (see below).

The first switch is safe over a tailscale SSH session: tailscale stays
installed (it is declared in `hosts/eos/server.nix` and homebrew cleanup is
off) and sshd is left enabled.

## Not getting locked out

Remote access depends on tailscaled surviving reboots and crashes. Layers of
defense, in order:

- **FileVault must be OFF** (`fdesetup status`). With FileVault on, a rebooted
  headless Mac sits at the pre-boot unlock screen with no network — nothing
  (sshd, tailscale) starts until someone types the password locally. Disable
  with `sudo fdesetup disable`, or use `sudo fdesetup authrestart` for planned
  reboots if you keep it on.
- **tailscaled as a root launchd daemon**: run `sudo brew services start tailscale`
  once. This registers `/Library/LaunchDaemons/homebrew.mxcl.tailscale.plist`
  with KeepAlive, so it starts at boot (before any login) and restarts on
  crash. Verify with `sudo brew services list`.
- **Watchdog** (declared in `hosts/eos/server.nix`): a root launchd job checks
  every 5 minutes that tailscaled is running and restarts/re-registers it if
  not.
- **No surprise reboots**: automatic macOS update installation is disabled
  declaratively; the machine also auto-restarts after power failure.
- **Independent fallback path**: Remote Login (sshd) is a native macOS system
  service, enabled declaratively and independent of nix/homebrew/tailscale.
  If tailscale dies, SSH to the machine's LAN IP from any device at the same
  location (or anything else on that network you can hop through). Consider
  giving eos a static IP / DHCP reservation in the router so the LAN address
  is predictable.
- **Risky changes**: before rebuilding with changes that touch networking or
  before rebooting, note that `darwin-rebuild --rollback` exists — but only
  helps while you still have a connection. Do such changes when someone can
  physically reach the machine, or schedule a delayed revert first.

## Users

Users are declared in `hosts/eos/users.nix` — one line per user. Every user
automatically inherits the full base config (zsh, git, starship, helix, ...)
via `home-manager.sharedModules`.

To add a user:

1. Add `<name> = <uid>;` (uids from 502 upwards) to `serverUsers` in
   `hosts/eos/users.nix`.
2. Rebuild **locally on the machine** — creating users over SSH requires
   Full Disk Access for sshd, otherwise activation aborts.
3. Set a password: `sudo sysadminctl -resetPasswordFor <name> -newPassword <pw>`

## Per-user packages

Any user can install packages independently:

- **nix**: `nix profile install nixpkgs#<pkg>` (flakes are enabled system-wide)
- **brew**: run `brew-init` once to get a personal Homebrew in `~/homebrew`,
  then `brew install <pkg>` as usual. The system `/opt/homebrew` stays owned by
  `admin` and is managed declaratively. Note: formulae outside the default
  prefix are built from source when no bottle is available.