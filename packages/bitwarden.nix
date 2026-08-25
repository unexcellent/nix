# A password manager
{ pkgs, username, ... }: {
  homebrew.masApps = {                    # installation via Mac Appstore
    "Bitwarden" = 1352778147;
  };
}