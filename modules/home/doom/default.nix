{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs31-pgtk;
  };
  services.emacs = {
    enable = true;
    client = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    # Emacs 基础包
    clang
    cmake
    libxml2
    nixfmt
    shfmt
    nixd
    pandoc # 提供 Markdown 编译/预览支持
    shellcheck # 提供 Shell 脚本的实时语法检查
    emacs-lsp-booster
    graphviz
  ];

  xdg.configFile."doom" = {
    source = ./configs;
    recursive = true;
  };
}
