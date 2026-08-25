# Terminal Emulator
{
  pkgs,
  username,
  ...
}: {
  # On macOS, ghostty ships as a native app; the nixpkgs package is a Linux
  # GTK/Wayland build and fails to compile on Darwin. Install the app via the
  # Homebrew cask and let home-manager manage only the config file.
  homebrew.casks = ["ghostty"];

  home-manager.users."${username}".programs.ghostty = {
    enable = true;
    package = null;
    settings = {
      theme = "Github Dark Default";
      font-family = "Menlo";
      font-size = 16;
      window-padding-x = 4;
      window-padding-y = 4;
      macos-option-as-alt = "left";
      confirm-close-surface = false;
      clipboard-trim-trailing-spaces = true;

      background-opacity = 0.85;

      # Use fish only inside ghostty; the login shell stays zsh. See fish.nix.
      command = "${pkgs.fish}/bin/fish --login --interactive";
      shell-integration = "fish";
    };
  };
}
