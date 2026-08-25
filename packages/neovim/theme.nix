{
  programs.nixvim = {
    colorscheme = "github_dark";
    colorschemes.github-theme = {
      enable = true;
      settings = {
        options = {
          transparent = true;
        };
      };
    };
    plugins = {
      web-devicons.enable = true;
      mini.enable = true;
    };
  };
}
