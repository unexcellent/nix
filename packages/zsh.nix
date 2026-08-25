# The shell of choice
{
  lib,
  username,
  ...
}: {
  home-manager.users."${username}" = {
    programs.zsh = {
      enable = true;
      autocd = false;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initContent = lib.mkBefore ''
        if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
          . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
          . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
        fi

        export NIX_PACKAGES=/nix/var/nix/profiles/system/sw/bin

        # Define variables for directories
        export PATH=$HOME/.local/share/bin:$PATH
        export PATH=$NIX_PACKAGES:$PATH

        # Remove history data we don't want to see
        export HISTIGNORE="pwd:ls:cd"
      '';
    };

    # Shell aliases for commonly used commands
    home.shellAliases = {
      c = "clear";
    };
  };
}
