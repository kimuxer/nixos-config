{ ... }:
{
  # ⚡ 核心隔离：
  # 将 Niri 专用的环境变量定义在 Niri 自身的配置树中。
  # 这样只有当从 SDDM 登录 Niri 时这些变量才会生效，登录 KDE 时不会受其影响。
  programs.niri.settings.environment = {
    # Niri 会话内强制使用的图形后端
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";

    # ⚡ 仅在 Niri 会话中禁用 Qt 应用的客户端窗口装饰，防止双重标题栏
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };
}
