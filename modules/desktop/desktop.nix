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
    inputs.niri.nixosModules.niri
    inputs.noctalia-greeter.nixosModules.default
  ];

  # ============================
  # Wayland XDG Portal 隔离设计
  # ============================
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
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
  };

  # ============================
  # Niri 窗口管理器
  # ============================
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

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
