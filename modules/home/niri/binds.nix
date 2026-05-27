{  ... }:

{
  programs.niri.settings.binds = {
    # === 1. 禁止重复的操作 (repeat=false) ===
    # 目的：确保动作精准，防止连按导致的意外行为

    # 退出NIRI
    "Ctrl+Shift+Delete" = { action.quit = [ ]; repeat = false; };

    # -- 应用启动与 DMS UI (IPC 调用) --
    "Mod+Return" = { action.spawn = [ "kitty" ]; repeat = false; };
    "Mod+D" = { action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ]; repeat = false; };
    "Mod+B" = { action.spawn = [ "zen" "--class" "zen-browser" ]; repeat = false; };
    "Mod+E" = { action.spawn = [ "kitty" "-e" "yazi" ]; repeat = false; };

    # DMS 功能组件
    "Mod+V" = { action.spawn = [ "dms" "ipc" "call" "clipboard" "toggle" ]; repeat = false; };
    "Mod+N" = { action.spawn = [ "dms" "ipc" "call" "notifications" "toggle" ]; repeat = false; };
    "Mod+M" = { action.spawn = [ "dms" "ipc" "call" "processlist" "focusOrToggle" ]; repeat = false; };
    "Mod+Y" = { action.spawn = [ "dms" "ipc" "call" "dankdash" "wallpaper" ]; repeat = false; };

    # 调整后的设置键 (L 旁边的分号键)
    "Mod+Semicolon" = { action.spawn = [ "dms" "ipc" "call" "settings" "focusOrToggle" ]; repeat = false; };

    # -- 核心布局控制 --
    # 预览模式 (显示所有列和行)
    "Mod+Space" = { action.toggle-overview = [ ]; repeat = false; };

    "Mod+Q" = { action.close-window = [ ]; repeat = false; };
    "Mod+T" = { action.toggle-window-floating = [ ]; repeat = false; };
    "Mod+F" = { action.fullscreen-window = [ ]; repeat = false; };
    "Mod+W" = { action.toggle-column-tabbed-display = [ ]; repeat = false; };
    "Mod+O" = { action.toggle-overview = [ ]; repeat = false; }; # 备份预览键
    "Mod+Shift+Slash" = { action.show-hotkey-overlay = [ ]; repeat = false; };

    # -- 标签页/列合并操作 (玩转 Tabbed 模式必用) --
    "Mod+Comma" = { action.consume-window-into-column = [ ]; repeat = false; }; # 吸取右侧列
    "Mod+Period" = { action.expel-window-from-column = [ ]; repeat = false; };  # 踢出当前窗

    # -- 会话与截图 --
    "Mod+Alt+L" = { action.spawn = [ "dms" "ipc" "call" "lock" "lock" ]; repeat = false; };
    "Mod+Shift+Q" = { action.spawn = [ "dms" "ipc" "call" "shell" "powermenu" ]; repeat = false; };

    "Ctrl+Shift+1" = { action.spawn = [ "dms" "ipc" "call" "niri" "screenshot" ]; repeat = false; };
    "Ctrl+Shift+2" = { action.spawn = [ "dms" "ipc" "call" "niri" "screenshotScreen" ]; repeat = false; };
    "Ctrl+Shift+3" = { action.spawn = [ "dms" "ipc" "call" "niri" "screenshotWindow" ]; repeat = false; };

    # -- 工作区快速跳转 --
    "Mod+Tab" = { action.focus-workspace-previous = [ ]; repeat = false; };
    "Mod+1" = { action.focus-workspace = 1; repeat = false; };
    "Mod+2" = { action.focus-workspace = 2; repeat = false; };
    "Mod+3" = { action.focus-workspace = 3; repeat = false; };
    "Mod+4" = { action.focus-workspace = 4; repeat = false; };
    "Mod+5" = { action.focus-workspace = 5; repeat = false; };
    "Mod+6" = { action.focus-workspace = 6; repeat = false; };
    "Mod+7" = { action.focus-workspace = 7; repeat = false; };
    "Mod+8" = { action.focus-workspace = 8; repeat = false; };
    "Mod+9" = { action.focus-workspace = 9; repeat = false; };

    "Mod+Shift+1" = { action.move-column-to-workspace = 1; repeat = false; };
    "Mod+Shift+2" = { action.move-column-to-workspace = 2; repeat = false; };
    "Mod+Shift+3" = { action.move-column-to-workspace = 3; repeat = false; };
    "Mod+Shift+4" = { action.move-column-to-workspace = 4; repeat = false; };
    "Mod+Shift+5" = { action.move-column-to-workspace = 5; repeat = false; };
    "Mod+Shift+6" = { action.move-column-to-workspace = 6; repeat = false; };
    "Mod+Shift+7" = { action.move-column-to-workspace = 7; repeat = false; };
    "Mod+Shift+8" = { action.move-column-to-workspace = 8; repeat = false; };
    "Mod+Shift+9" = { action.move-column-to-workspace = 9; repeat = false; };


    # === 2. 允许重复的操作 (默认 repeat=true) ===
    # 目的：支持长按快速切换或连续调节

    # -- 焦点导航与移动 (HJKL) --
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

    "Mod+R".action.switch-preset-column-width = [ ];
    "Mod+Shift+R".action.reset-window-height = [ ];
    "Mod+F11".action.maximize-column = [ ];

    # -- DMS 硬件控制 (带音量/亮度条) --
    "XF86AudioRaiseVolume".action.spawn = [ "dms" "ipc" "call" "audio" "increment" "3" ];
    "XF86AudioLowerVolume".action.spawn = [ "dms" "ipc" "call" "audio" "decrement" "3" ];
    "XF86AudioMute".action.spawn = [ "dms" "ipc" "call" "audio" "mute" ];

    "XF86MonBrightnessUp".action.spawn = [ "dms" "ipc" "call" "brightness" "increment" "5" "" ];
    "XF86MonBrightnessDown".action.spawn = [ "dms" "ipc" "call" "brightness" "decrement" "5" "" ];

    # -- 鼠标控制 --
    "Mod+WheelScrollDown".action.focus-column-right = [ ];
    "Mod+WheelScrollUp".action.focus-column-left = [ ];
  };
}
