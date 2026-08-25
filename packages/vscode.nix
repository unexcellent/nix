# A code editor
{
  pkgs,
  username,
  ...
}: {
  home-manager.users."${username}".programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        github.github-vscode-theme
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        tomoki1207.pdf
        yzhang.markdown-all-in-one
      ];

      userSettings = {
        # Set the vscode theme
        "workbench.colorTheme" = "GitHub Dark Default";

        # If true, a confirmation message is displayed before a file is deleted.
        "explorer.confirmDelete" = false;

        # If true, a confirmation message is displayed before a file is moved.
        "explorer.confirmDragAndDrop" = false;

        # If true, a confimation message is displayed before a file is pasted.
        "explorer.confirmPasteNative" = false;

        # If true, all changes are staged if you try to commit without any staged changes.
        "git.suggestSmartCommit" = false;

        # If true, git changes are automatically fetched periodically.
        "git.autofetch" = true;

        # If true, a confirmation message is displayed before git is synced.
        "git.confirmSync" = false;

        # Set when to open another git repo in the workspace if a file from that repo is opened (options: 'always', 'never').
        "git.openRepositoryInParentFolders" = "never";

        # Position of the side bar (options: 'left', 'right').
        "workbench.sideBar.location" = "right";

        # If none, no welcome message is displayed.
        "workbench.startupEditor" = "none";

        # If true, no extension recommendation messages are displayed.
        "extensions.ignoreRecommendations" = true;

        "files.associations" = {
          # All files ending in .keymap should have C syntax highlighting.
          "*.keymap" = "c";
        };

        "github.copilot.enable" = {
          "*" = false;
          "plaintext" = false;
          "markdown" = false;
          "scminput" = false;
        };

        # If "on", line numbers will be shown in jupyter notebooks
        "notebook.lineNumbers" = "on";
      };

      keybindings = [
        {
          key = "shift shift";
          command = "workbench.action.quickOpen";
        }
        {
          key = "cmd+p";
          command = "workbench.action.showCommands";
        }
        {
          key = "cmd+t";
          command = "workbench.action.terminal.new";
        }
        {
          key = "shift+cmd+t";
          command = "workbench.action.terminal.killActiveTab";
        }
      ];
    };
  };
}
