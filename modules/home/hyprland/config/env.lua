-- /home/kim/.config/hypr/env.lua

-- 逐行调用 hl.env 进行注入
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Nvidia 胶水
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- 强制原生 Wayland 支持
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME" , "qt6ct")
hl.env("NIXOS_OZONE_WL", "1")
hl.env("NIXOS_OZONE_API" , "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT" , "auto")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("BROWSER" , "zen")
