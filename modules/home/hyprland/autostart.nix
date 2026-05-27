# modules/home/hyprland/autostart.nix
{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # 输入法框架
      "fcitx5 -d --replace"

      # 自动挂载 U 盘
      "udiskie --smart-tray"

      # DMS 面板（通过 systemd 用户服务启动）
      "systemctl --user start dms"

      # 网络管理小程序（可选）
      # "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"

      # 状态栏（如果你不用 DMS 自带的状态栏）
      # "${pkgs.waybar}/bin/waybar"
    ];
  };
}