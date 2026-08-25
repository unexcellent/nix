# A terminal prompt that improves the looks and handling of the terminal
{ ... }: {
  home-manager.sharedModules = [
    {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        settings = {
          gcloud.disabled = true;
        };
      };
    }
  ];
}
