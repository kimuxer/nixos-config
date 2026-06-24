{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    waylandSupport = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];
  };
}
