{ username, pkgs, home-manager, ... }: {
  home-manager = {

    # This saves an extra Nixpkgs evaluation, adds consistency, and removes the dependency on 
    # NIX_PATH, which is otherwise used for importing Nixpkgs.
    useGlobalPkgs = true;

    # Installs packages to the user directory
    useUserPackages = true;

    # This creates a backup of configuration files before they are overwritten
    backupFileExtension = "backup";

    # Set up the user and enable home manager programs
    users."${username}" = {
      programs.home-manager.enable = true;
      home.stateVersion = "24.05";
    };
  };
}