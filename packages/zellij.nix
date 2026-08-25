# A modern terminal multiplexer
{username, ...}: {
  home-manager.users."${username}".programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      show_startup_tips = false;

      theme = "github-dark"; 
      themes = {
        "github-dark-custom" = {
          fg = "#c9d1d9";
          bg = "#0d1117";

          black = "#24292e";
          red = "#f85149";
          green = "#3fb950";
          yellow = "#d29922";
          blue = "#58a6ff";
          magenta = "#bc8cff";
          cyan = "#39c5cf";
          white = "#f0f6fc";

          orange = "#4078c0";
        };
      };
    };
  };
}
