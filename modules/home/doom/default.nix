{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs31-nox;
  };
  services.emacs = {
    enable = true;
    client = {
      enable = true;
      arguments = [ "-t" ];
    };
  };

  home.packages = with pkgs; [
    # Emacs 基础包
    clang
    cmake
    nixfmt
    nixd
    pandoc # 提供 Markdown 编译/预览支持
    shellcheck # 提供 Shell 脚本的实时语法检查
  ];

  xdg.configFile."doom" = {
    source = ./configs;
    recursive = true;
  };
  # -------------------------------------------------------------
  # 注入全局和后台守护进程的环境变量，锁定配置目录为 ~/.config/doom
  # -------------------------------------------------------------
  #systemd.user.sessionVariables = {
  #  DOOMDIR = "/home/kim/.config/doom";
  #};

  #home.sessionVariables = {
  #  DOOMDIR = "/home/kim/.config/doom";
  #};
  # -------------------------------------------------------------
}
