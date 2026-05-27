{ pkgs, inputs, lib, ... }:

{
  imports = [
    # 挂载 DMS 官方的系统层服务与登录器模块
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms.nixosModules.greeter
  ];

  # ============================
  # 基础系统服务
  # ============================
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.dbus.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;

  # ============================
  # Wayland XDG Portal 门户
  # ============================
  xdg.portal = {
    enable = true;
    extraPortals = [
                        # pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland # 🌟 核心补充：确保登录器和桌面的 Hyprland 都能正确调用门户服务
    ];

    # 首选门户改为 hyprland，GTK 负责文件选择对话框
    config.common.default = [ "*" ];
  };

  # ============================
  # 物理层 Hyprland 开启
  # ============================
  programs.hyprland = {
    enable = true;
    # 极其重要：利用最新的 UWSM，将所有图形环境变量和 systemd 服务深度绑定
    withUWSM = true;
  };

  # ============================
  # DMS + Greeter 登录器
  # ============================
  programs.dank-material-shell = {
    enable = true;
    #greeter = {
     # enable = true;
      #compositor = {
       # name = "hyprland"; # 👈 顺从官方文档指南，完美采用 Hyprland 作为登录背景合成器
     # };

      # 告诉登录器去哪里加载你的配色和设置
     # configHome = "/home/kim";
    #};
  };
}
