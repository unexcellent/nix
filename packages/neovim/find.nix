{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        keymaps = {
          "<leader>f" = {
            mode = "n";
            action = "find_files";
          };
        };
        extensions = {
          fzf-native.enable = true;
        };
        settings = {
          defaults = {
            vimgrep_arguments = [
              "${pkgs.ripgrep}/bin/rg"
              "-L"
              "--color=never"
              "--no-heading"
              "--with-filename"
              "--line-number"
              "--column"
              "--smart-case"
              "--fixed-strings"
            ];
            selection_caret = "  ";
            entry_prefix = "  ";
            layout_strategy = "flex";
            layout_config = {
              horizontal = {
                prompt_position = "top";
              };
            };
            sorting_strategy = "ascending";

            path_display = [ "filename_first" ];

            file_ignore_patterns = [
              "^.git/"
              "^.mypy_cache/"
              "^.pytest_cache/"
              "^.ruff_cache/"
              "^__pycache__/"
              "^.venv/"
              "^venv/"
              "^target/"
              "^output/"
              "^data/"
              "%.ipynb"
              "%.pyc"
              "%.so"
              "%.dylib"
              "%.png"
              "%.pdf"
              "%.jpg"
              "%.lock"
              ".DS_Store"
            ];
            set_env.COLORTERM = "truecolor";
          };
          pickers = {
            colorscheme.enable_preview = true;
            find_files = {
              hidden = true;
              find_command = [
                "${pkgs.ripgrep}/bin/rg"
                "--files"
                "--hidden"
                "--no-ignore-vcs"
              ];
            };
          };
        };
      };
    };
  };
}
