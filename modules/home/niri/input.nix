{  ... }:

{
  programs.niri.settings.input = {
    tablet.enable = false;
    touch.enable = false;
    touchpad.enable = false;
    trackball.enable = false;
    trackpoint.enable = false;

    # --- 1. 键盘设置 (Keyboard) ---
    keyboard = {
      xkb.layout = "us";
      repeat-delay = 400;
      repeat-rate = 30;
    };

    # --- 2. 鼠标设置 (Mouse / Pointer) ---
    mouse = {
      accel-speed = 0.2;         # 鼠标灵敏度 (-1.0 到 1.0)。
      accel-profile = "flat";    # "flat": 禁用加速
      scroll-factor = 1.5;       # 滚轮缩放系数 (如果你觉得滚轮太快或太慢)
    };

    warp-mouse-to-focus.enable = true;  # 当你用键盘快捷键 (Mod+HJKL) 切换窗口时，鼠标指针是否自动跳到新窗口中心

  };
}
