# -- modules/home/neovim/default.nix --
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./ui/ui.nix
    ./editor/options.nix
    ./editor/binds.nix
    ./plugins/whichkey.nix
    ./plugins/others.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/formatting.nix
    ./plugins/completion.nix
    ./plugins/languages.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };
    };
  };
}
