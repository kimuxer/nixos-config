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

      # 语言语法解析器 (直接作为包安装)
      tree-sitter-grammars.tree-sitter-lua
      tree-sitter-grammars.tree-sitter-vim
      tree-sitter-grammars.tree-sitter-rust
      tree-sitter-grammars.tree-sitter-nix
      tree-sitter-grammars.tree-sitter-markdown
      tree-sitter-grammars.tree-sitter-kdl
      tree-sitter-grammars.tree-sitter-toml
      tree-sitter-grammars.tree-sitter-yaml
      tree-sitter-grammars.tree-sitter-json
      tree-sitter-grammars.tree-sitter-fish
      tree-sitter-grammars.tree-sitter-ini
    ];
  };
}
