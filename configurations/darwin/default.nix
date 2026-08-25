{
  username,
  config,
  pkgs,
  nix-homebrew,
  homebrew-bundle,
  homebrew-core,
  homebrew-cask,
  ...
}: {
  system.primaryUser = username;

  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };

  # Setup user, packages, programs
  nix = {
    settings.trusted-users = ["@admin" "${username}"];

    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };

    # Turn this on to make command line easier
    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
      allowInsecure = false;
      allowUnsupportedSystem = true;
    };
  };

  nix-homebrew = {
    enable = true;
    user = "${username}";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
    };
    mutableTaps = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
  };

  environment.systemPackages = [ pkgs.mas ];

  imports = [
    ./dock.nix
    ./finder.nix
    ./keyboard.nix
    ./loginwindow.nix
    ./menubar.nix
    ./nsglobaldomain.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
  system.stateVersion = 6;
}
