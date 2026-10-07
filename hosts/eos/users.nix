# Declarative user accounts on this server.
#
# Adding a user:
#   1. Add an entry to `serverUsers` below (their public keys are optional,
#      they can also append to ~/.ssh/authorized_keys themselves later).
#   2. Rebuild LOCALLY on the machine (creating users over SSH requires
#      Full Disk Access for sshd, otherwise activation aborts).
#   3. Optional: a password is only needed for GUI / screen sharing logins:
#      sudo sysadminctl -resetPasswordFor <name> -newPassword <pw>
#
# Every user automatically inherits the full base config (fish, git, starship, ...)
# via home-manager.sharedModules. On top of that they can:
#   - declare extra home-manager config in users/<name>.nix (picked up if it exists)
#   - nix profile install nixpkgs#<pkg>   # per-user nix packages
#   - brew-init && brew install <pkg>     # per-user Homebrew in ~/homebrew
#
# Server users are standard (non-admin) macOS accounts: they have no sudo and
# are not nix trusted-users, since either would be equivalent to root.
{ pkgs, lib, username, ... }:
let
  # Logs into every account on this machine, including the admin.
  masterKeyFiles = [ ../../keys/eos.pub ];

  # uids must be > 501 (502, 503, ...). The primary "admin" user (uid 501) is
  # created during macOS setup and managed in configurations/darwin, NOT here.
  serverUsers = {
    tk = {
      uid = 502;
    };

    gb = {
      uid = 503;
    };

    # alice = {
    #   uid = 504;
    #   keys = [ "ssh-ed25519 AAAA... alice@laptop" ];
    # };
  };

  userModule = name: ./users + "/${name}.nix";
in {
  # Users listed here are created (and deleted) by nix-darwin via sysadminctl.
  users.knownUsers = builtins.attrNames serverUsers;

  # Keys end up in /etc/ssh/nix_authorized_keys.d/<user>, which sshd reads in
  # addition to ~/.ssh/authorized_keys, so users can still manage their own.
  users.users = lib.mapAttrs (name: user: {
    inherit name;
    inherit (user) uid;
    home = "/Users/${name}";
    shell = pkgs.fish;
    createHome = true;
    openssh.authorizedKeys = {
      keyFiles = masterKeyFiles;
      keys = user.keys or [ ];
    };
  }) serverUsers // {
    ${username}.openssh.authorizedKeys.keyFiles = masterKeyFiles;
  };

  # Register each user with home-manager so home-manager.sharedModules
  # (the whole package set) applies to them.
  home-manager.users = lib.mapAttrs (name: _: {
    imports = lib.optional (builtins.pathExists (userModule name)) (userModule name);
    programs.home-manager.enable = true;
    home.stateVersion = "24.05";
  }) serverUsers;

  # The primary user predates nix and must not be in knownUsers, so nix-darwin
  # never touches its login shell. Enforce fish for it here instead
  # (activation runs as root, so dscl works and no chsh is needed).
  #
  # macOS creates homes as 750 with group staff, and every account is in
  # staff, so homes would be readable by all other users.
  system.activationScripts.postActivation.text = ''
    fish=/run/current-system/sw/bin/fish
    if [ "$(dscl . -read /Users/${username} UserShell 2>/dev/null | awk '{print $2}')" != "$fish" ]; then
      echo "setting login shell of ${username} to fish"
      dscl . -create /Users/${username} UserShell "$fish"
    fi

  ''
  # When Remote Login is restricted to "Only these users", sshd drops anyone
  # outside com.apple.access_ssh right after authentication.
  + lib.concatMapStrings (name: ''
    if [ -d /Users/${name} ]; then chmod 700 /Users/${name}; fi
    if dscl . -read /Groups/com.apple.access_ssh >/dev/null 2>&1; then
      dseditgroup -o edit -a ${name} -t user com.apple.access_ssh
    fi
  '') (builtins.attrNames serverUsers);
}
