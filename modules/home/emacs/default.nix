# -- modules/home/emacs/default.nix --
{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs31-nox;
    # 在这里声明你需要的插件
    extraPackages =
      epkgs: with epkgs; [
        doom-themes
        doom-modeline
        evil
        evil-collection
        magit
        orderless
        vertico
        marginalia
        inheritenv
        envrc
        nix-mode
        kdl-mode
        apheleia
        corfu
      ];
  };

  services.emacs = {
    enable = true;
    #    package = pkgs.emacs31-nox;
    client = {
      enable = true;
      arguments = [
        "-t"
      ];
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
