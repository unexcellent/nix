{ pkgs, nixvim, ... }:
let
  dir = ./.;
  files = builtins.attrNames (builtins.readDir dir);
  nixFiles = builtins.filter (name:
    name != "default.nix" && builtins.match ".*\\.nix$" name != null
  ) files;
  modulePaths = builtins.map (name: dir + "/${name}") nixFiles;
in {
  environment.systemPackages = [ pkgs.ripgrep ];

  imports = [ nixvim.nixDarwinModules.default ] ++ modulePaths;

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    opts = {
      updatetime = 100;
      number = true;
      relativenumber = true;
      autoindent = true;
      autowrite = true;
      confirm = true;
      clipboard = "unnamedplus";
      cursorline = true;
      list = true;
      expandtab = true;
      shiftround = true;
      shiftwidth = 4;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      tabstop = 4;
      ignorecase = true;
      incsearch = true;
      completeopt = "menu,menuone,noselect";
      wildmode = "longest:full,full";
      swapfile = false;
      undofile = true;
      undolevels = 10000;
      conceallevel = 2;

      termguicolors = true;
    };

    extraConfigLua = ''
      -- Dynamically set scrolloff to 25% of the window height
      vim.api.nvim_create_autocmd({"BufEnter", "WinEnter", "VimResized"}, {
        callback = function()
          vim.opt.scrolloff = math.floor(vim.api.nvim_win_get_height(0) / 4)
        end,
      })
    '';
  };
}
