{
  programs.nixvim = {
    plugins = {
      sleuth.enable = true;
      nvim-autopairs.enable = true;
      flash.enable = true;
    };
    keymaps = [
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "s";
        action = "<cmd>lua require('flash').jump()<cr>";
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "S";
        action = "<cmd>lua require('flash').treesitter()<cr>";
      }
    ];
  };
}
