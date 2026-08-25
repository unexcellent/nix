# The Rust programming language
{
  pkgs,
  username,
  ...
}: {
  # Installing rust itself
  environment.systemPackages = [
    pkgs.rustup
    pkgs.rust-analyzer
    pkgs.cargo-generate
  ];

  home-manager.users."${username}".programs = {
    helix = {
      languages = {
        language = [
          {
            name = "rust";
            language-servers = ["rust-analyzer"];
            formatter = {
              command = "rustfmt";
              args = ["--edition" "2024"];
            };
            auto-format = true;
          }
        ];
        language-server = {
          rust-analyzer = {
            command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          };
        };
      };
    };

    vscode.profiles.default = {
      # Rust-related vscode extensions
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
      ];

      # Rust-related vscode settings
      userSettings = {
        # Clippy should be default code checker
        "rust-analyzer.check.command" = "clippy";
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          "editor.formatOnSave" = true;
        };

        # If true, no update notifications from lldb are displayed
        "lldb.suppressUpdateNotifications" = true;
      };
    };
  };
}
