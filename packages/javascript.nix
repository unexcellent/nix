# The node package manager
{ pkgs, username, ... }: {
  environment.systemPackages = [ pkgs.nodejs_24 pkgs.pnpm pkgs.bun pkgs.fnm ];

  home-manager.sharedModules = [
    {
      # fnm has to modify the PATH of the running shell, so it needs a hook in every shell's init.
      programs.zsh.initContent = ''
        eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
      '';

      programs.fish.interactiveShellInit = ''
        fnm env --use-on-cd --version-file-strategy=recursive --shell fish | source
      '';
    }
  ];
}
