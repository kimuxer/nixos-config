# modules/home/hyprland/binds.nix
{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    $mod = SUPER [cite: 5]

    # -- 应用启动与 DMS 界面 --
    bind = $mod, Return, exec, kitty [cite: 6]
    bind = $mod, D, exec, dms ipc call spotlight toggle [cite: 6]
    bind = $mod, B, exec, zen --class zen-browser [cite: 6]
    bind = $mod, E, exec, kitty -e yazi [cite: 6]

    # DMS 功能组件
    bind = $mod, V, exec, dms ipc call clipboard toggle [cite: 7]
    bind = $mod, N, exec, dms ipc call notifications toggle [cite: 7]
    bind = $mod, M, exec, dms ipc call processlist focusOrToggle [cite: 7]
    bind = $mod, Y, exec, dms ipc call dankdash wallpaper [cite: 7]
    bind = $mod, semicolon, exec, dms ipc call settings focusOrToggle [cite: 7]

    # -- 核心窗口控制 --
    bind = $mod, Q, killactive [cite: 7]
    bind = $mod, T, togglefloating [cite: 8]
    bind = $mod, F, fullscreen, 1
    bind = $mod SHIFT, F, fullscreen, 0

    # 原生 scroller 的合流控制
    bind = $mod, comma, scroller:admitwindow, [cite: 9]
    bind = $mod, period, scroller:expelwindow, [cite: 9, 10]

    # -- 会话与截图 --
    bind = $mod ALT, L, exec, dms ipc call lock lock [cite: 11]
    bind = $mod SHIFT, Q, exec, dms ipc call shell powermenu [cite: 11]
    bind = CTRL SHIFT, 1, exec, dms screenshot [cite: 11]
    bind = CTRL SHIFT, 2, exec, dms screenshot full [cite: 11]
    bind = CTRL SHIFT, 3, exec, dms screenshot last [cite: 12]

    # -- 🚀 原生 scroller 纸带焦点移动 (完全复刻 Niri 体验) --
    bind = $mod, H, scroller:movefocus, l
    bind = $mod, L, scroller:movefocus, r
    bind = $mod, K, scroller:movefocus, u
    bind = $mod, J, scroller:movefocus, d

    # 交换窗口在纸带上的相对位置
    bind = $mod SHIFT, H, scroller:movewindow, l
    bind = $mod SHIFT, L, scroller:movewindow, r
    bind = $mod SHIFT, K, scroller:movewindow, u
    bind = $mod SHIFT, J, scroller:movewindow, d

    # 纸带视图等比缩放
    bind = $mod, equal, scroller:zoom, +0.1
    bind = $mod, minus, scroller:zoom, -0.1

    # 预设列宽快速循环切换
    bind = $mod, R, scroller:cyclewidth, next

    # -- 工作区快速跳转 --
    bind = $mod, Tab, workspace, previous [cite: 12]
    bind = $mod, 1, workspace, 1 [cite: 12]
    bind = $mod, 2, workspace, 2 [cite: 12]
    bind = $mod, 3, workspace, 3 [cite: 12]
    bind = $mod, 4, workspace, 4 [cite: 13]
    bind = $mod, 5, workspace, 5 [cite: 13]
    bind = $mod, 6, workspace, 6 [cite: 13]
    bind = $mod, 7, workspace, 7 [cite: 13]
    bind = $mod, 8, workspace, 8 [cite: 13]
    bind = $mod, 9, workspace, 9 [cite: 13]

    # 移动窗口到工作区
    bind = $mod SHIFT, 1, movetoworkspace, 1 [cite: 13]
    bind = $mod SHIFT, 2, movetoworkspace, 2 [cite: 13]
    bind = $mod SHIFT, 3, movetoworkspace, 3 [cite: 13]
    bind = $mod SHIFT, 4, movetoworkspace, 4 [cite: 13]
    bind = $mod SHIFT, 5, movetoworkspace, 5 [cite: 14]
    bind = $mod SHIFT, 6, movetoworkspace, 6 [cite: 14]
    bind = $mod SHIFT, 7, movetoworkspace, 7 [cite: 14]
    bind = $mod SHIFT, 8, movetoworkspace, 8 [cite: 14]
    bind = $mod SHIFT, 9, movetoworkspace, 9 [cite: 14]

    # -- DMS 硬件控制 --
    bind = , xf86audioraisevolume, exec, dms ipc call audio increment 3 [cite: 17]
    bind = , xf86audiolowervolume, exec, dms ipc call audio decrement 3 [cite: 17]
    bind = , xf86audiomute, exec, dms ipc call audio mute [cite: 17]
    bind = , xf86monbrightnessup, exec, dms ipc call brightness increment 5 [cite: 17, 18]
    bind = , xf86monbrightnessdown, exec, dms ipc call brightness decrement 5 [cite: 18]

    # -- 鼠标滚轮切换纸带列 --
    bind = $mod, mouse_down, scroller:movefocus, r
    bind = $mod, mouse_up, scroller:movefocus, l

    # 鼠标拖拽窗口/调整大小 [cite: 19]
    bindm = $mod, mouse:272, movewindow [cite: 19]
    bindm = $mod, mouse:273, resizewindow [cite: 19]
  '';
}
