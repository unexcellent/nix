{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          "<leader>E" = "open_float";
          "[" = "goto_prev";
          "]" = "goto_next";
          "<leader>do" = "setloclist";
        };
        lspBuf = {
          "K" = "hover";
          "gD" = "declaration";
          "gd" = "definition";
          "gr" = "references";
          "gI" = "implementation";
          "gy" = "type_definition";
          "<leader>ca" = "code_action";
          "<leader>cr" = "rename";
          "<leader>wl" = "list_workspace_folders";
          "<leader>wr" = "remove_workspace_folder";
          "<leader>wa" = "add_workspace_folder";
        };
      };
      preConfig = ''
        vim.diagnostic.config({
          virtual_text = false,
          severity_sort = true,
          float = {
            border = 'rounded',
            source = 'always',
          },
        })

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
          vim.lsp.handlers.hover,
          {border = 'rounded'}
        )

        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          {border = 'rounded'}
        )
      '';
      postConfig = ''
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      '';
      servers = {
        jsonls.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        nixd.enable = true;
        yamlls.enable = true;
        taplo.enable = true;
        ruff.enable = true;
      };
    };
    bacon.enable = true;
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          rust = ["rustfmt"];
          python = ["ruff_format" "ruff_fix"];
          nix = ["alejandra"];
        };
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 500;
        };
      };
    };
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          dap.adapters.lldb = {
            type = "server";
            port = "${''$''}{port}";
            executable = {
              command = "codelldb";
              args = ["--port" "${''$''}{port}"];
            };
          };
        };
        tools.enable_clippy = true;
        server = {
          default_settings = {
            inlayHints = {lifetimeElisionHints = {enable = "always";};};
            rust-analyzer = {
              cargo = {allFeatures = true;};
              check = {command = "clippy";};
              files = {excludeDirs = ["target" ".git" ".cargo" ".github" ".direnv"];};
            };
          };
        };
      };
    };
  };
}
