# The Rust programming language
{
  pkgs,
  ...
}: {
  # Installing rust itself
  environment.systemPackages = [
    pkgs.rustup
    pkgs.rust-analyzer
    pkgs.cargo-generate
  ];

  home-manager.sharedModules = [
    {
      programs = {
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
                config = {
                  # Separate target dir (target/rust-analyzer) so cargo builds
                  # and rust-analyzer don't block on each other's lock or
                  # invalidate each other's cache.
                  cargo.targetDir = true;
                  # Don't check tests/examples; they don't build on no_std targets.
                  check.allTargets = false;
                };
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
  ];
}
