{ ... }:
{
  # --- 1. 底层系统环境变量 ---
  # 这些是全局生效的驱动层和图形后端设置，应在进程启动前就载入
  environment.variables = {
    # NVIDIA 驱动配置 (驱动与图形后端)
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # 图形后端 (后端驱动)
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    ## 外观与主题
    QT_QPA_PLATFORMTHEME = "qt6ct";

    # greetd 界面鼠标样式
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };

  # --- 2. 用户会话环境变量 ---
  # 这些是属于你的图形界面会话、输入法和外观偏好，随用户登录生效
  environment.sessionVariables = {
    # 桌面环境元数据
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";

    # 应用行为优化
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    DMS_RUN_GREETER = "1";
    
    # 输入法 (注：部分 NixOS 模块可能已经通过 i18n 设置处理了，建议检查)
                #XMODIFIERS = "@im=fcitx";

    # 编辑器
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
