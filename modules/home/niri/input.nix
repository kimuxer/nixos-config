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
      accel-speed = 0.2;
      accel-profile = "flat";
      scroll-factor = 1.5;
    };

    warp-mouse-to-focus.enable = true;

  };
}
