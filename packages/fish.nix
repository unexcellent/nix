{pkgs, ...}: {
  programs.fish.enable = true;

  # Allow fish as a login shell (chsh checks /etc/shells). The
  # /run/current-system path is stable across rebuilds, unlike the store path.
  environment.shells = [pkgs.fish "/run/current-system/sw/bin/fish"];

  home-manager.sharedModules = [
    {
      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          set -gx NIX_PACKAGES /nix/var/nix/profiles/system/sw/bin
          fish_add_path $HOME/.local/share/bin
        '';
      };
    }
  ];
}
