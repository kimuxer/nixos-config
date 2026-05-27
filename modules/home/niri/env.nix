# modules/home/hyprland/env.nix
{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XDG_CURRENT_DESKTOP,niri"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,niri"

      # Qt 平台及主题
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_QPA_PLATFORMTHEME,qt6ct"

      # 强制其他工具包使用 Wayland
      "SDL_VIDEODRIVER,wayland"
      "CLUTTER_BACKEND,wayland"
      "GDK_BACKEND,wayland;x11"

      # Electron / Chromium / Firefox 原生 Wayland
      "NIXOS_OZONE_WL,1"
      "MOZ_ENABLE_WAYLAND,1"

      # Java 应用修复
      "_JAVA_AWT_WM_NONREPARENTING,1"

      # 输入法
      #"XMODIFIERS,@im=fcitx"
      #"GTK_IM_MODULE,fcitx"
      #"QT_IM_MODULE,fcitx"
      #"SDL_IM_MODULE,fcitx"
    ];
  };
}
