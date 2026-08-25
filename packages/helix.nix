# A command line text editor
{
  pkgs,
  username,
  ...
}: {
  home-manager.users."${username}".programs.helix = {
    enable = true;
    # Custom theme inheriting github_dark but with a cleared background,
    # so the terminal's own background shows through (transparency).
    themes.github_dark_transparent = {
      inherits = "github_dark";
      "ui.background" = {};
    };
    settings = {
      theme = "github_dark_transparent";
      editor = {
        line-number = "relative";
        soft-wrap.enable = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys.normal = {
        y = "yank_to_clipboard";
        p = "paste_clipboard_after";
        P = "paste_clipboard_before";
        d = [
          "yank_to_clipboard"
          "delete_selection"
        ];
        D = "delete_selection";
      };
      keys.select = {
        y = "yank_to_clipboard";
        d = [
          "yank_to_clipboard"
          "delete_selection"
        ];
        D = "delete_selection";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          language-servers = ["nil"];
          formatter = {
            command = "${pkgs.alejandra}/bin/alejandra";
          };
          auto-format = true;
        }
      ];
      language-server = {
        nil = {
          command = "${pkgs.nil}/bin/nil";
        };
      };
    };
  };
}
