{ pkgs, ... }:
{
  xdg.configFile."nvim" = {
    source = ./configs;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    waylandSupport = true;

    extraPackages = with pkgs; [
      lua-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];
  };
}
