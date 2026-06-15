{ ... }:

{
  programs.niri.settings.binds = {
    # 退出 Niri
    "Ctrl+Shift+Delete" = { action.quit = [ ]; };

    # 应用启动
    "Mod+Return" = { action.spawn = [ "footclient" ]; };
    "Mod+B"      = { action.spawn = [ "firefox" ]; };
    "Mod+E"      = { action.spawn = [ "footclient" "-e" "yazi" ]; };

    # Noctalia 面板与设置
    "Mod+D"         = { action.spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ]; };
    "Mod+V"         = { action.spawn = [ "noctalia" "msg" "panel-toggle" "clipboard" ]; };
    "Mod+M"         = { action.spawn = [ "noctalia" "msg" "panel-toggle" "control-center" ]; };
    "Mod+Y"         = { action.spawn = [ "noctalia" "msg" "panel-toggle" "wallpaper" ]; };
    "Mod+Semicolon" = { action.spawn = [ "noctalia" "msg" "settings-toggle" ]; };

    # 核心布局控制
    "Mod+Space"       = { action.toggle-overview = [ ]; };
    "Mod+Q"           = { action.close-window = [ ]; };
    "Mod+T"           = { action.toggle-window-floating = [ ]; };
    "Mod+F"           = { action.fullscreen-window = [ ]; };
    "Mod+Shift+Slash" = { action.show-hotkey-overlay = [ ]; };

    "Mod+W"      = { action.toggle-column-tabbed-display = [ ]; };
    "Mod+Comma"  = { action.consume-window-into-column = [ ]; };
    "Mod+Period" = { action.expel-window-from-column = [ ]; };

    # 会话与截图
    "Mod+Alt+L"   = { action.spawn = [ "noctalia" "msg" "session" "lock" ]; };
    "Mod+Shift+Q" = { action.spawn = [ "noctalia" "msg" "panel-toggle" "session" ]; };

    "Ctrl+Shift+1" = { action.spawn = [ "noctalia" "msg" "screenshot-region" ]; };
    "Ctrl+Shift+2" = { action.spawn = [ "noctalia" "msg" "screenshot-fullscreen" ]; };

    # -- 工作区快速跳转 --
    "Mod+Tab" = { action.focus-workspace-previous = [ ]; };
    "Mod+1" = { action.focus-workspace = 1; };
    "Mod+2" = { action.focus-workspace = 2; };
    "Mod+3" = { action.focus-workspace = 3; };
    "Mod+4" = { action.focus-workspace = 4; };
    "Mod+5" = { action.focus-workspace = 5; };
    "Mod+6" = { action.focus-workspace = 6; };
    "Mod+7" = { action.focus-workspace = 7; };
    "Mod+8" = { action.focus-workspace = 8; };
    "Mod+9" = { action.focus-workspace = 9; };

    "Mod+Shift+1" = { action.move-column-to-workspace = 1; };
    "Mod+Shift+2" = { action.move-column-to-workspace = 2; };
    "Mod+Shift+3" = { action.move-column-to-workspace = 3; };
    "Mod+Shift+4" = { action.move-column-to-workspace = 4; };
    "Mod+Shift+5" = { action.move-column-to-workspace = 5; };
    "Mod+Shift+6" = { action.move-column-to-workspace = 6; };
    "Mod+Shift+7" = { action.move-column-to-workspace = 7; };
    "Mod+Shift+8" = { action.move-column-to-workspace = 8; };
    "Mod+Shift+9" = { action.move-column-to-workspace = 9; };



    # 焦点导航
    "Mod+H".action.focus-column-left = [ ];
    "Mod+L".action.focus-column-right = [ ];
    "Mod+K".action.focus-window-up = [ ];
    "Mod+J".action.focus-window-down = [ ];
    "Mod+Shift+H".action.move-column-left = [ ];
    "Mod+Shift+L".action.move-column-right = [ ];
    "Mod+Shift+K".action.move-window-up = [ ];
    "Mod+Shift+J".action.move-window-down = [ ];

    # -- 布局尺寸微调 --
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-10%";
    "Mod+Shift+Equal".action.set-window-height = "+10%";

    # -- 硬件控制 --
    "XF86AudioRaiseVolume"  = { action.spawn = [ "noctalia" "msg" "volume-up" ]; };
    "XF86AudioLowerVolume"  = { action.spawn = [ "noctalia" "msg" "volume-down" ]; };
    "XF86AudioMute"         = { action.spawn = [ "noctalia" "msg" "volume-mute" ]; };
    "XF86MonBrightnessUp"   = { action.spawn = [ "noctalia" "msg" "brightness-up" ]; };
    "XF86MonBrightnessDown" = { action.spawn = [ "noctalia" "msg" "brightness-down" ]; };

    # -- 鼠标控制 --
    "Mod+WheelScrollDown".action.focus-column-right = [ ];
    "Mod+WheelScrollUp".action.focus-column-left = [ ];
  };
}
