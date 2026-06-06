{ ... }:

{
  programs.niri.settings.binds = {
    # === 1. 禁止重复的操作 (repeat=false) ===
    
    # 退出 Niri
    "Ctrl+Shift+Delete" = { action.quit = [ ]; repeat = false; };
    
    # -- 应用启动 --
    "Mod+Return" = { action.spawn = [ "footclient" ]; repeat = false; };
    "Mod+B"      = { action.spawn = [ "zen" "--class" "zen-browser" ]; repeat = false; };
    "Mod+E"      = { action.spawn = [ "footclient" "-e" "yazi" ]; repeat = false; };
    
    # -- Noctalia 原生 IPC 调用 (替换了 dms) --
    "Mod+D"           = { action.spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ]; repeat = false; };
    "Mod+V"           = { action.spawn = [ "noctalia" "msg" "panel-toggle" "clipboard" ]; repeat = false; };
    "Mod+N"           = { action.spawn = [ "noctalia" "msg" "panel-toggle" "notifications" ]; repeat = false; };
    "Mod+M"           = { action.spawn = [ "noctalia" "msg" "process-list-toggle" ]; repeat = false; };
    "Mod+Y"           = { action.spawn = [ "noctalia" "msg" "wallpaper-next" ]; repeat = false; };
    "Mod+Semicolon"   = { action.spawn = [ "noctalia" "msg" "settings-toggle" ]; repeat = false; };

    # -- 核心布局控制 --
    "Mod+Space"       = { action.toggle-overview = [ ]; repeat = false; };
    "Mod+Q"           = { action.close-window = [ ]; repeat = false; };
    "Mod+T"           = { action.toggle-window-floating = [ ]; repeat = false; };
    "Mod+F"           = { action.fullscreen-window = [ ]; repeat = false; };
    "Mod+W"           = { action.toggle-column-tabbed-display = [ ]; repeat = false; };
    "Mod+O"           = { action.toggle-overview = [ ]; repeat = false; };
    "Mod+Shift+Slash" = { action.show-hotkey-overlay = [ ]; repeat = false; };

    "Mod+Comma"       = { action.consume-window-into-column = [ ]; repeat = false; };
    "Mod+Period"      = { action.expel-window-from-column = [ ]; repeat = false; };

    # -- 会话与截图 (使用 Noctalia 原生 IPC) --
    "Mod+Alt+L"       = { action.spawn = [ "noctalia" "msg" "session-lock" ]; repeat = false; };
    "Mod+Shift+Q"     = { action.spawn = [ "noctalia" "msg" "session-powermenu" ]; repeat = false; };

    "Ctrl+Shift+1"    = { action.spawn = [ "noctalia" "msg" "screenshot" ]; repeat = false; };
    "Ctrl+Shift+2"    = { action.spawn = [ "noctalia" "msg" "screenshot-screen" ]; repeat = false; };
    "Ctrl+Shift+3"    = { action.spawn = [ "noctalia" "msg" "screenshot-window" ]; repeat = false; };

    # -- 工作区跳转 --
    "Mod+Tab" = { action.focus-workspace-previous = [ ]; repeat = false; };
    # ... (保持原有的 Mod+1 到 Mod+9 以及 Shift 的配置即可) ...


    # === 2. 允许重复的操作 (repeat=true) ===

    # -- 焦点导航 (HJKL) --
    "Mod+H".action.focus-column-left = [ ];
    "Mod+L".action.focus-column-right = [ ];
    "Mod+K".action.focus-window-up = [ ];
    "Mod+J".action.focus-window-down = [ ];

    # -- 布局尺寸微调 --
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-10%";
    "Mod+Shift+Equal".action.set-window-height = "+10%";

    # -- 硬件控制 (替换 dms) --
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
