let
  selectOpts = ''{ behavior = cmp.SelectBehavior.Insert }'';
in
{ pkgs, ... }: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        performance.debounce = 150;
        sources = [
          { name = "path"; }
          {
            name = "nvim_lsp";
            keywordLength = 1;
          }
          {
            name = "buffer";
            keywordLength = 3;
          }
          { name = "luasnip"; }
        ];
        mapping = {
          "<S-Tab>" = "cmp.mapping.select_prev_item(${selectOpts})";
          "<Tab>" = "cmp.mapping.select_next_item(${selectOpts})";
          "<C-k>" = "cmp.mapping.scroll_docs(-4)";
          "<C-j>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({select = false})";
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-treesitter.enable = true;
    lspkind.enable = true;
    lspkind.cmp.enable = true;
    luasnip.enable = true;
  };
}
