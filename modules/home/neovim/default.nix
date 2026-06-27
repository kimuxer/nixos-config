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
      blink-cmp
      noice-nvim
      plenary-nvim
      (nvim-treesitter.withPlugins (p: [
        p.lua
        p.nix
        p.toml
        p.yaml
        p.json
        p.markdown
        p.rust
        p.vim
        p.fish
      ]))
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
