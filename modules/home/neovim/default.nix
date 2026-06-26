{ pkgs, ... }:
{
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # 核心配置开发工具
      lua-language-server
      nixfmt
      stylua

      # 插件构建与编译环境
      gcc
      gnumake
      luarocks
    ];
  };
}
