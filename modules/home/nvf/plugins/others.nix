{ ... }:
{
  programs.nvf.settings.vim.utility.direnv.enable = true;

  programs.nvf.settings.vim.clipboard = {
    enable = true;
    providers.wl-copy.enable = true;
  };
}
