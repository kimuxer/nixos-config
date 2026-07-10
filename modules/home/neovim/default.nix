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

    plugins = with pkgs.vimPlugins; [
      blink-cmp     # 等待解决blink.lib
    ];

    extraPackages = with pkgs; [
      # 核心配置开发工具
      lua-language-server
      tree-sitter

      # 格式化工具
      nixfmt
      stylua
      taplo
      yamlfmt
      prettierd          # 支持 JavaScript, TypeScript, CSS, HTML, JSON, Markdown 等
      # 插件构建与编译环境
      gcc
      gnumake
      luarocks
    ];
  };
}
