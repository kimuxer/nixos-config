# -- modules/home/nvf/plugins/treesitter.nix --
{ ... }:
{
  programs.nvf.settings.vim.treesitter = {
    enable = true;
    indent.enable = false;
    grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
      kdl
    ];
  };
}
