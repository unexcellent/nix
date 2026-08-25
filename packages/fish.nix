{...}: {
  programs.fish.enable = true;

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
