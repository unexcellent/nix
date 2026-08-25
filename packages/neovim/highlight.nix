{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;

      settings = {
        indent.enable = true;
        highlight.enable = true;
        auto_install = false;
        ensure_installed = [];
      };
    };
  };
}
