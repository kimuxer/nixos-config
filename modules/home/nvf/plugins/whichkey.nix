# -- modules/home/nvf/plugins/whichkey.nix --
{ ... }:
{
  programs.nvf.settings.vim = {
    visuals.nvim-web-devicons.enable = true;

    binds.whichKey = {
      enable = true;
    };
  };
}
