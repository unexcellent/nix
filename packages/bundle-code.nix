# A script for copying the content of all python files in a project into the clipboard for giving AI context
{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "bundle-code" ''
      #!/bin/bash

      # Consolidate project snapshot into a variable
      SNAPSHOT=$(cat <<EOF
      ======================================
      Project context

      --- FILE STRUCTURE ---
      $(tree -I "venv|__pycache__|.git|target|*.tif|*.tiff" -F)

      --- FILE CONTENTS ---
      EOF
      )

      # Find and append relevant code/config files
      # Excludes hidden files, venv, and binary data
      while read -r file; do
          SNAPSHOT+=$'\n\n'"FILE: $file"$'\n'
          SNAPSHOT+="--------------------------------------"$'\n'
          SNAPSHOT+="$(cat "$file")"$'\n'
      done < <(find . -maxdepth 10 -not -path '*/.*' -not -path "./venv*" -not -path "./target*" -type f \( -name "*.py" -o -name "*.toml" -o -name "*.nix" -o -name "*.rs" -o -name "*.yaml" -o -name "*.sh" -o -name "*.cron" -o -name "Dockerfile" -o -name "*.ts" -o -name "*.json" -o -name "*.html" -o -name "*.js" -o -name "*.css" -o -name "*.tsx" -o -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.ino" \))

      SNAPSHOT+="======================================"$'\n'
      # Send to macOS clipboard
      echo "$SNAPSHOT" | pbcopy

      echo "✅ Project context (Structure + Files) copied to clipboard."
    '')
  ];
}
