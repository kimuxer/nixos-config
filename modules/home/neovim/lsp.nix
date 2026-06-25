# -- modules/home/neovim/lsp.nix --
{ ... }:
{
  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;
    enableFormat = true;
    nix = {
      enable = true;
      lsp.enable = true;
      lsp.servers = ["nixd"];
    };
    fish = {
      enable = true;
      lsp.enable = true;
    };
    lua = {
      enable = true;
      lsp.enable = true;
    };
    markdown = {
      enable = true;
      lsp.enable = true;
    };
    toml = {
      enable = true;
      lsp.enable = true;
    };
  };
}
