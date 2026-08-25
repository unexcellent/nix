# The python programming language
{
  pkgs,
  ...
}: {
  environment.systemPackages = [
    # Core Python package
    pkgs.python313

    # Pip package manager
    pkgs.python313Packages.pip

    # Venv for creating virtual environments
    pkgs.python313Packages.virtualenv

    # Poetry for declarative package management.
    # Its test suite fails on Darwin in recent nixpkgs (cosmetic assertion
    # mismatches in the installer tests), so the check phase is skipped.
    (pkgs.poetry.overrideAttrs (_: {
      doCheck = false;
      doInstallCheck = false;
    }))

    # UV package manager
    pkgs.uv

    # Mypy standard python package manager
    pkgs.mypy

    # Python language server
    pkgs.pyright

    # Linter and formatter
    pkgs.ruff

    # Shell script for streamlining creation of virtual environment
    (pkgs.writeScriptBin "venv" ''
      #!/usr/bin/env bash
      if [ -d ".venv" ]; then
        rm -rf .venv
      fi

      python -m venv .venv
      source .venv/bin/activate

      if [ ! -f "pyproject.toml" ]; then
        exit 1
      fi

      if grep -q "\[tool.poetry\]" pyproject.toml; then
        poetry install
      else
        pip install -e '.[docs,test]'
      fi
    '')
  ];

  home-manager.sharedModules = [
    {
      programs = {
        helix = {
          languages = {
            language = [
              {
                name = "python";
                # Multiple LSPs (Pyright for types, Ruff for linting)
                language-servers = ["pyright" "ruff"];
                formatter = {
                  command = "${pkgs.ruff}/bin/ruff";
                  args = ["format" "-"];
                };
                auto-format = true;
              }
            ];
            language-server = {
              pyright = {
                command = "${pkgs.pyright}/bin/pyright-langserver";
                args = ["--stdio"];
              };
              ruff = {
                command = "${pkgs.ruff}/bin/ruff";
                args = ["server"];
              };
            };
          };
        };

        vscode.profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            # Core python packages
            ms-python.python # disabled until package is fixed
            ms-python.debugpy

            # Automatically generate docstring
            njpwerner.autodocstring

            # Modern python code linter and formatter
            charliermarsh.ruff
          ];

          userSettings = {
            # File patterns to exclude from the explorer view
            "files.exclude" = {
              "**/__pycache__" = true;
            };
          };
        };
      };
    }
  ];
}
