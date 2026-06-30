# -- modules/home/nvf/lazy/lsp.nix --
{ ... }:
{
  programs.nvf.settings.vim.languages = {
    enableFormat = true;
    enableDAP = true;

    nix = {
      enable = true;
      treesitter.enable = true;
      lsp.enable = true;
      lsp.servers = ["nixd"];
    };
    fish = {
      enable = true;
      treesitter.enable = true;
      lsp.enable = true;
    };
    lua = {
      enable = true;
      treesitter.enable = true;
      lsp.enable = true;
    };
    markdown = {
      enable = true;
      treesitter.enable = true;
      lsp.enable = true;
    };
    toml = {
      enable = true;
      treesitter.enable = true;
      lsp.enable = true;
    };
    rust = {
      enable = true;
      treesitter.enable = true;
      lsp.enable = true;
    };
  };
}
