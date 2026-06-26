# -- modules/home/neovim/default.nix --
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./keymaps.nix
    ./lsp.nix
    ./plugins.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      syntaxHighlighting = true;

      options = {
        mouse = "a";
        tabstop = 2;
        shiftwidth = 0;
        smartindent = true;
        expandtab = true;
        cursorline = true;
      };
      # 插件
      lazy.loader = true;

      treesitter = {
        enable = true;
        indent.enable = false;
      };

      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };
    };
  };
}
