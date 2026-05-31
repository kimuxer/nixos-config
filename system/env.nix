{ ... }:
{
  systemd.services.sddm.environment = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # --- 1. 底层系统环境变量 ---
  # 仅保留基础的显卡驱动配置和全局鼠标样式，对所有桌面环境通用
  environment.variables = {
    # NVIDIA 驱动配置
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    # 全局基础鼠标样式
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };

  # --- 2. 全局用户会话环境变量 ---
  # 仅保留安全的、不对特定会话产生干扰的工具链与编辑器配置
  environment.sessionVariables = {
    # 常用应用的基础 Wayland 优化（Niri 和 KDE 均支持且通用）
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";

    # 默认编辑器
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
