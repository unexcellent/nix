# A terminal prompt that improves the looks and handling of the terminal
{ username, ... }: {
  home-manager.users."${username}".programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      gcloud.disabled = true;
    };
  };
}
