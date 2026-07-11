# -- modules/home/nvf/plugins/diagnostics.nix --
{ pkgs, ... }:
{
  programs.nvf.settings.vim.diagnostics = {
    enable = true;
    presets = {
      statix.enable = true;
      taplo.enable = true;
      shellcheck.enable = true;
      markdownlint-cli2.enable = true;
    };
  };

  programs.nvf.settings.vim.extraPackages = with pkgs; [
    statix
    taplo
    shellcheck
    markdownlint-cli2
  ];
}
