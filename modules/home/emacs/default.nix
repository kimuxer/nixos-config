# -- modules/home/emacs/default.nix --
{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs31-pgtk;
    # 在这里声明你需要的插件
    extraPackages =
      epkgs: with epkgs; [
        kdl-mode
        apheleia
      ];
  };

  services.emacs = {
    enable = true;
    #    package = pkgs.emacs31-nox;
    client = {
      enable = true;
    };
  };

  # 只有那些不需要 Emacs 插件系统加载的外部工具才放在这里
  home.packages = with pkgs; [
    clang
    cmake
    shellcheck
    alejandra
    shfmt
    nixd # nix 语言服务器
    taplo # toml 语言服务器
    bash-language-server # shell 语言服务器
  ];

  xdg.configFile."emacs" = {
    source = ./configs;
    recursive = true;
  };
}
