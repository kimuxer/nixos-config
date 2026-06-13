{ ... }:

{
  programs.niri.settings.window-rules = [
    # --- 1. 全局基础规则 (WhiteSur 风格) ---
    {
      # 统一所有窗口的圆角为 6px
      geometry-corner-radius = {
        top-left = 6.0;
        top-right = 6.0;
        bottom-left = 6.0;
        bottom-right = 6.0;
      };
      clip-to-geometry = true;
    }

    # --- 2. Zen 浏览器专用规则 ---
    {
      matches = [{ app-id = "zen"; }];
      open-maximized = true;
      open-on-workspace = "2";
      # 浏览器不需要透明，关闭 Niri 的背景绘制以提高性能并消除圆角锯齿
      draw-border-with-background = false;
    }

    # --- 3. foot 终端特化规则 (核心：解决透明度) ---
    {
      matches = [{ app-id = "footclient"; }];
      draw-border-with-background = false;
      opacity = 0.95;
    }

    # --- 4. 非活动窗口变暗效果 ---
    {
      # 当窗口失去焦点时，设置透明度为 0.9，产生层级感
      matches = [{ is-active = false; }];
      # 排除 Kitty，因为终端我们通常希望它背景一直透明但文字清晰
      excludes = [
        { app-id = "zen"; }
        { app-id = "com.danklinux.dms"; }
      ];
      opacity = 0.8;
    }

    {
      # 匹配 fcitx5 configurations
      matches = [{ app-id = "org.fcitx."; }];
      # 强制浮动，不参与平铺排版
      open-floating = true;
      # 禁用装饰：系统组件不应该有聚焦环、边框或阴影
      focus-ring.enable = false;
      border.enable = false;
      shadow.enable = false;
    }
    # --- 6. 常见弹出窗口处理 ---
    {
      # 匹配类似对话框、选择器等窗口
      matches = [
        { title = "Open File"; }
        { title = "Save File"; }
        { app-id = "satty"; }
      ];
      open-floating = true;
    }
  ];
}
