# Declarative user accounts on this server.
#
# Adding a user:
#   1. Add one line to `serverUsers` below.
#   2. Rebuild LOCALLY on the machine (creating users over SSH requires
#      Full Disk Access for sshd, otherwise activation aborts).
#   3. Set a password: sudo sysadminctl -resetPasswordFor <name> -newPassword <pw>
#
# Every user automatically inherits the full base config (zsh, git, starship, ...)
# via home-manager.sharedModules and can install additional packages on their own:
#   nix profile install nixpkgs#<pkg>   # per-user nix packages
#   brew-init && brew install <pkg>     # per-user Homebrew in ~/homebrew
{ pkgs, lib, ... }:
let
  # name = uid; uids must be > 501 (502, 503, ...). The primary "admin" user
  # (uid 501) is created during macOS setup and managed in
  # configurations/darwin, NOT here.
  serverUsers = {
    # alice = 502;
  };
in {
  # Users listed here are created (and deleted) by nix-darwin via sysadminctl.
  users.knownUsers = builtins.attrNames serverUsers;

  users.users = lib.mapAttrs (name: uid: {
    inherit name uid;
    home = "/Users/${name}";
    shell = pkgs.zsh;
    createHome = true;
  }) serverUsers;

  # Register each user with home-manager so home-manager.sharedModules
  # (the whole package set) applies to them.
  home-manager.users = lib.mapAttrs (name: _: {
    programs.home-manager.enable = true;
    home.stateVersion = "24.05";
  }) serverUsers;
}
