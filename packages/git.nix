# The most used version control system in the world
{ pkgs, ... }: {
  home-manager.sharedModules = [
    {
      programs.git = {
        enable = true;

        # Default .gitignores
        ignores = [ "*.swp" ".DS_Store" ];

        # If true, git large file system is enabled by default
        lfs = { enable = true; };

        settings = {
          # Set the default repo branch
          init.defaultBranch = "main";

          # Credentials
          user = {
            name = "unexcellent";
            email = "";
          };

          # Set up the builtin editor
          core = { editor = "vim"; autocrlf = "input"; };

          # If true, each branch is rebased after a push
          pull.rebase = true;

          # If true, changes are automatically stashed during a rebase
          rebase.autoStash = true;

          # If true, a branch is automatically set up at remote if a commit is pushed
          push.autoSetupRemote = true;
        };
      };

      # Shell aliases for common git commands
      home.shellAliases = {
        co = "git checkout";
        pull = "git pull";
      };
    }
  ];

  # Scripts for simplifying git actions
  environment.systemPackages = [
    (pkgs.writeScriptBin "branch" ''
      #!/usr/bin/env bash
      git branch $1;
      git checkout $1;
    '')
    (pkgs.writeScriptBin "commit" ''
      #!/usr/bin/env bash

      # Stage all changes, commit them and push them to remote.
      # Usage:
      # commit "my lovely commit message"

      git add .;
      git commit -m "$1";
      git push;
    '')
  ];
}
