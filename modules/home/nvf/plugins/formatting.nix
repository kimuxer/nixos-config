# -- modules/home/nvf/plugins/formatting.nix --
{ ... }:
{
  programs.nvf.settings.vim.formatter.conform-nvim = {
    enable = true;
    setupOpts = {
      formatters_by_ft = {
        lua = ["stylua"];
        markdown = ["prettierd"];
        json = ["prettierd"];
        nix = ["nixfmt"];
        toml = ["taplo"];
        yaml = ["yamlfmt"];
        rust = ["rustfmt"];
      };
    };
  };
}
