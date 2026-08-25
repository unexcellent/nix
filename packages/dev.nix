# A script for launching the dev config in a project
{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "dev" ''
      #!/bin/bash

      # Check if an argument was provided
      if [ -z "$1" ]; then
          echo "Error: No folder name provided."
          exit 1
      fi


      # Paths to search
      DEV_DIR="$HOME/user/dev"
      CONFIG_DIR="$HOME/user/config"

      # If first argument is 'ls', list all folders in both directories
      if [ "$1" = "ls" ]; then
          echo "Listing folders in $DEV_DIR and $CONFIG_DIR:"
          find "$DEV_DIR" "$CONFIG_DIR" -maxdepth 1 -mindepth 1 -type d 2>/dev/null \
              | sort \
              | sed "s|$HOME/user/||"
          exit 0
      fi

      # Set folder name and search paths
      FOLDER_NAME="$1"
      DEV_PATH="$HOME/user/dev/$FOLDER_NAME"
      CONFIG_PATH="$HOME/user/config/$FOLDER_NAME"

      # Check for folder in dev, then in config
      if [ -d "$DEV_PATH" ]; then
          TARGET_PATH="$DEV_PATH"
      elif [ -d "$CONFIG_PATH" ]; then
          TARGET_PATH="$CONFIG_PATH"
      else
          echo "Error: Folder '$FOLDER_NAME' not found in ~/user/dev or ~/user/config."
          exit 1
      fi

      # Navigate to the found directory and launch zellij
      cd "$TARGET_PATH" || { echo "Error: Failed to change directory."; exit 1; }
      zellij

    '')
  ];
}
