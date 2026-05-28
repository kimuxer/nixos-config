{ ... }:

{
  programs.niri.settings.window-rules = [
    # --- 1. 全局基础规则 (WhiteSur 风格) ---
    {
      # 统一所有窗口的圆角为 12px
      geometry-corner-radius = {
        top-left = 10.0;
        top-right = 10.0;
        bottom-left = 10.0;
        bottom-right = 10.0;
      };
      clip-to-geometry = true;
    }

    # --- 2. Zen 浏览器专用规则 ---
    {
      matches = [{ app-id = "zen"; }];
      # 打开时自动最大化。
      # 注意：maximized 会自动避让 DMS 的状态栏，而 fullscreen 会盖住它。
      open-maximized = true;
      open-on-workspace = "2";
      # 浏览器不需要透明，关闭 Niri 的背景绘制以提高性能并消除圆角锯齿
      draw-border-with-background = false;
    }

    # --- 3. Kitty 终端特化规则 (核心：解决透明度) ---
    {
      matches = [{ app-id = "kitty"; }];
      # 【极其重要】：必须设为 false，否则 Kitty 的 0.75 透明度会被 Niri 垫在底下的背景盖住
      draw-border-with-background = false;
      # 强制终端不参与“非活动变暗”，保持代码始终清晰
      opacity = 0.95;
    }
    {
      matches = [{ app-id = "footclient"; }];
      # 【极其重要】：必须设为 false，否则 Kitty 的 0.75 透明度会被 Niri 垫在底下的背景盖住
      draw-border-with-background = false;
      # 强制终端不参与“非活动变暗”，保持代码始终清晰
      opacity = 0.85;
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

    # --- 5. DMS (Quickshell) 组件适配 ---
    {
      # 匹配 DMS 的面板、启动器、锁屏等组件
      matches = [{ app-id = "org\\.quickshell$"; }];
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
      ];
      open-floating = true;
    }
  ];
}
