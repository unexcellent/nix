# Per-user Homebrew for multi-user machines.
# The system-wide /opt/homebrew belongs to the primary user (via nix-homebrew);
# other users run `brew-init` once to get their own Homebrew in ~/homebrew.
# Note: formulae outside the default prefix are built from source when no
# bottle is available.
{ pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "brew-init" ''
      #!/usr/bin/env bash
      set -e

      if [ -w /opt/homebrew/bin/brew ]; then
        echo "You own the system Homebrew at /opt/homebrew - no per-user install needed."
        exit 1
      fi

      if [ -d "$HOME/homebrew" ]; then
        echo "Per-user Homebrew already exists at $HOME/homebrew."
        exit 0
      fi

      git clone https://github.com/Homebrew/brew "$HOME/homebrew"
      eval "$("$HOME/homebrew/bin/brew" shellenv)"
      brew update --force --quiet
      echo "Done. Restart your shell, then use brew as usual."
    '')
  ];

  home-manager.sharedModules = [
    {
      # Prefer a per-user Homebrew, fall back to the system one
      programs.zsh.initContent = ''
        if [[ -d "$HOME/homebrew" ]]; then
          eval "$("$HOME/homebrew/bin/brew" shellenv)"
        elif [[ -x /opt/homebrew/bin/brew ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
      '';

      programs.fish.interactiveShellInit = ''
        if test -d $HOME/homebrew
          $HOME/homebrew/bin/brew shellenv | source
        else if test -x /opt/homebrew/bin/brew
          /opt/homebrew/bin/brew shellenv | source
        end
      '';
    }
  ];
}
