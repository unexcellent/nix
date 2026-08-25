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

Bootstrap: create the initial macOS account with the short name `admin`
(it becomes `system.primaryUser` and owns the system Homebrew), then follow
the setup steps above and build with `nixup eos`.

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