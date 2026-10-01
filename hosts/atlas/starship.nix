# Minimal prompt: directory, git branch/status and command duration. Merges on
# top of the base starship config from packages/starship.nix.
{ ... }: {
  home-manager.sharedModules = [
    {
      programs.starship.settings = {
        format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      };
    }
  ];
}
