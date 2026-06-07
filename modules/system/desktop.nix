{ pkgs, inputs, lib, ... }:

{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.silentSDDM.nixosModules.default
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
  # Wayland XDG Portal 隔离设计
  # ============================
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      # 注：KDE Plasma 开启后，系统会自动将其所需的 xdg-desktop-portal-kde 加入。
    ];
    
    # ⚡ 核心隔离配置：根据 XDG_CURRENT_DESKTOP 动态决定调用哪个后端
    config = {
      common = {
        default = [ "gtk" ];
      };
      # Niri 会话的首选配置（屏幕共享等使用 gnome/gtk）
      niri = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
      # KDE 会话原生配置（自动回退给 kde 自身实现）
      kde = {
        default = [ "kde" ];
      };
    };
  };

  # ============================
  # Niri 窗口管理器
  # ============================
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  # ============================
  # 启用 KDE Plasma 6 桌面环境
  # ============================
  services.desktopManager.plasma6.enable = true;

  # ============================
  # Display Manager 登录器
  # ============================
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      wayland.compositor = "kwin";
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = "20";
        };
      };
    };
  };

  programs.silentSDDM = {
        enable = true;
        theme = "default-left"; 
  };
  
  # 关闭冲突服务
  systemd.user.services.niri-flake-polkit.enable = lib.mkForce false;
}
