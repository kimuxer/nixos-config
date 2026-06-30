# -- modules/home/nvf/plugins/whichkey.nix --
{ ... }:
{
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;
    setupOpts = {
      spec = { { "<Esc><Esc>", hidden = true } };
    };
  };
}
