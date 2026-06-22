# -- modules/desktop/desktop.nix --
{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [
    inputs.silentSDDM.nixosModules.default
    inputs.niri.nixosModules.niri
    inputs.noctalia-greeter.nixosModules.default
  ];

  # ============================
  # 桌面环境基础服务
  # ============================
  services.desktopManager.plasma6.enable = true;

  # ============================
  # Wayland XDG Portal 隔离设计
  # ============================
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
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
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Screenshot" = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [
          "gtk"
        ];
      };
      # KDE 会话原生配置（自动回退给 kde 自身实现）
      kde = {
        default = [ "kde" ];
      };
    };
  };
  # ============================
  # 桌面环境基础环境变量
  # ============================

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    GSK_RENDERER = "gl";
    __GL_THREADED_OPTIMIZATIONS = "1";
    EDITOR = "hx";
    VISUAL = "hx";
  };

  # ============================
  # Niri 窗口管理器
  # ============================
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  # ============================
  # Display Manager 登录器
  # ============================
  #services.displayManager = {
  #  defaultSession = "niri";
  #  sddm = {
  #    enable = true;
  #    wayland.enable = true;
  #    wayland.compositor = "kwin";
  #    settings = {
  #      Theme = {
  #        CursorTheme = "Bibata-Modern-Ice";
  #        CursorSize = "20";
  #      };
  #    };
  #  };
  #};

  #programs.silentSDDM = {
  #  enable = true;
  #  theme = "default-left";
  #};


  #   解决 greeter界面 鼠标右下方噪点问题
  #services.greetd.settings.default_session.command = lib.mkForce (
  #  "env WLR_NO_HARDWARE_CURSORS=1 ${config.programs.noctalia-greeter.package}/bin/noctalia-greeter-session -- ${config.programs.noctalia-greeter.greeter-args}"
  #);

  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

    # Optional configuration
    greeter-args = "--session Niri --user kim";
    settings.cursor = {
      theme = "Bibata-Modern-Ice";
      size = 20;
    };
  };
}
