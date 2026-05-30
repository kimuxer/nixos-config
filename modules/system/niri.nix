{ pkgs, inputs, lib, ... }:

{
  imports = [
    # ✅ 官方正确模块名
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms.nixosModules.greeter
    inputs.niri.nixosModules.niri
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
  #services.devmon.enable = true;
  services.tumbler.enable = true;

  # ============================
  # Wayland XDG Portal (优化：适配 Niri 官方标准)
  # ============================
  xdg.portal = {
    enable = true;
    # Niri 自身实现了 screencast，完美的搭配是 gnome (用于投屏) 和 gtk (用于文件选择器)
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];

    config.common.default = "gtk";
  };

  # ============================
  # Niri 窗口管理器 (必须保留！负责系统级注册)
  # ============================
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  # ============================
  # DMS + Greeter 登录器
  # ============================
  programs.dank-material-shell = {
    enable = true;
    greeter = {
      enable = true;
      compositor = {
        name = "niri";
      };

      configHome = "/home/kim";
    };
  };
  # 暂时使用ly作为DM 
#  services.displayManager.ly.enable = true;
  # 关闭冲突服务
  systemd.user.services.niri-flake-polkit.enable = lib.mkForce false;
}
