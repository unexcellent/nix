# Command to produce a depth indented directory listing
{ pkgs, username, ... }:
{
  environment.systemPackages = [ pkgs.tree ];

  home-manager.users."${username}".home.shellAliases = {
    tree = "tree -I '.git|.mypy_cache|.ruff_cache|__pycache__|.venv|venv|target|data|*.ipynb|*.pyc|*.so|*.dylib|.DS_Store'";
  };
}
