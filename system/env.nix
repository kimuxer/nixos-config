{ ... }:
{
  environment.sessionVariables = {
    # --- 1. NVIDIA 硬件胶水 (已去重) ---
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # 解决 1080Ti 老卡光标消失问题

    # --- 2. Wayland 桌面环境元数据 ---
    XDG_CURRENT_DESKTOP = "niri"; # 如果你切回 Hyprland，这里记得改成 Hyprland
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri"; # 建议补齐，有些应用需要此项识别会话

    # --- 3. Qt & GTK 平台集成 ---
    QT_QPA_PLATFORM = "wayland;xcb"; # 建议加上 ;xcb，兼容旧版 Qt 程序
    QT_QPA_PLATFORMTHEME = "qt6ct";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11"; # 补齐 x11 后备，防止部分 GTK3 应用启动失败

    # --- 4. 浏览器与 Electron ---
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    GTK_USE_PORTAL = "1";
    # --- 5. 输入法与 Java (防闪烁) ---
    _JAVA_AWT_WM_NONREPARENTING = "1";

    # ⚡ 补齐输入法全家桶：这是解决部分 GTK/Qt 应用输入框不显示的终极方案
    XMODIFIERS = "@im=fcitx";
    #GTK_IM_MODULE = "fcitx";
    #QT_IM_MODULE = "fcitx";

    # --- 6. 视觉外观 ---
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };
}
