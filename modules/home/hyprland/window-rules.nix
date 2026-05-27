# modules/home/hyprland/window-rules.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # 全局圆角已在 layout.nix 的 decoration.rounding 中设置，此处不重复。

    windowrulev2 = [
      # --- 1. 全局非活动窗口变暗 (模拟 Niri 的 is-active = false) ---
      # 活动透明度 = 1.0，非活动透明度 = 0.9，作用于所有窗口
      "opacity 1.0 override 0.9 override, class:.*"
      # 排除 Kitty 终端和 Zen 浏览器，让它们始终保持完全不透明
      "opacity 1.0 override 1.0 override, class:^(kitty)$"
      "opacity 1.0 override 1.0 override, class:^(zen)$"

      # --- 2. Zen 浏览器专用规则 ---
      # Hyprland 没有直接 open-maximized 规则，如需最大化，
      # 建议在启动命令中加参数，例如：zen --start-maximized
      # 这里设置去除边框背景，保持简洁 (对应 draw-border-with-background = false)
      "noborder, class:^(zen)$"        # 隐藏窗口边框
      "noshadow, class:^(zen)$"        # 移除阴影，减少视觉干扰

      # --- 3. Kitty 终端规则 ---
      # 透明度由 Kitty 自身控制，Hyprland 不会像 Niri 那样垫背景，
      # 因此无需专门关闭 draw-border-with-background。
      # 此处仅去掉边框，保持终端界面干净
      "noborder, class:^(kitty)$"

      # --- 4. DMS / Quickshell 组件规则 ---
      # 匹配所有 org.quickshell.quickshell 窗口
      "float, class:^(org\\.quickshell\\.quickshell)$"
      "noborder, class:^(org\\.quickshell\\.quickshell)$"
      "noshadow, class:^(org\\.quickshell\\.quickshell)$"
      "noanim, class:^(org\\.quickshell\\.quickshell)$"  # 无动画，响应更快
      "noinitialfocus, class:^(org\\.quickshell\\.quickshell)$" # 避免抢焦点
      "pin, class:^(org\\.quickshell\\.quickshell)$"             # 始终在顶层

      # --- 5. 常见弹出窗口浮动处理 ---
      "float, title:^(Open File|Save File|Select Folder)$"
      "center, title:^(Open File|Save File|Select Folder)$"     # 居中弹出
    ];
  };
}