# modules/home/hyprland/input.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      # --- 1. 键盘设置 ---
      kb_layout = "us";               # 布局：美式英语
      # kb_options = "caps:escape";   # 若需将 CapsLock 改为 Esc，可取消注释

      # 按键重复手感 (与 Niri 保持一致)
      repeat_delay = 250;             # 按住 250ms 后开始重复
      repeat_rate = 40;               # 每秒重复 40 次

      # 焦点跟随鼠标 (Focus Follows Mouse)
      # Niri 的 focus-follows-mouse = false → Hyprland 设为 0
      follow_mouse = 0;              # 0：鼠标移动不自动切换焦点

      # Hyprland 没有直接的 “warp-mouse-to-focus” 选项。
      # 如果你习惯键盘移动时鼠标自动居中，可以通过 Hyprctl 脚本实现，
      # 或者使用插件，这里暂不设置。按需可添加 exec-once 调用的脚本。

      # --- 2. 鼠标 / 指针设置 ---
      sensitivity = 0.2;             # 对应 Niri 的 accel-speed，范围 -1.0 到 1.0
      accel_profile = "flat";        # 禁用鼠标加速，实现 1:1 精准移动

      # 滚轮速度 (无直接等价项，可使用 scroll_factor，但 Hyprland 通过 libinput 更底层)
      # 若希望完全复现，可考虑在系统级通过 services.libinput 配置。
      # 这里使用 Hyprland 的 scroll_method 和 scroll_button 相关设置来近似，
      # 但通常保留默认即可，无需额外操作。

      # --- 3. 触摸板 (如果你使用笔记本) ---
      # 建议添加，以保持一致的滚动手感
      # touchpad {
      #   natural_scroll = true;
      #   scroll_factor = 1.0;
      # }
    };
  };
}
