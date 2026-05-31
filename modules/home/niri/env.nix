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

    # Niri 独享的 Qt 样式代理（KDE 会自动使用其自身的 native 样式，互不打架）
    QT_QPA_PLATFORMTHEME = "qt6ct";

    # 输入法
    #XMODIFIERS = "@im=fcitx";
  };
}
