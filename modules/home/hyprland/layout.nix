# modules/home/hyprland/layout.nix
{ config, pkgs, ... }:

{
  # 🌟 核心修正：使用 extraConfig 绕过 Nix 的属性集转换，给 Hyprland 最纯粹的 conf 文本
  wayland.windowManager.hyprland.extraConfig = ''
    # --- 1. 激活原生滚动布局 ---
    general {
        layout = scroller
        gaps_in = 5 [cite: 21]
        gaps_out = 15 [cite: 21]
        border_size = 2 [cite: 21]
        col.active_border = 0xffcba6f7 [cite: 21]
        col.inactive_border = 0xff45475a [cite: 22]
    }

    # --- 2. 窗口装饰 ---
    decoration {
        rounding = 8 [cite: 30]

        # 顺应 0.55.x 最新阴影语法
        shadow {
            enabled = true
            range = 4
            render_power = 3
            color = 0xee1e1e2e
        }

        blur {
            enabled = true [cite: 24]
            size = 5 [cite: 24]
            passes = 2 [cite: 24]
        }
    }

    # --- 3. 原生 scroller 布局专属设置 ---
    # 彻底告别 scrolling 错误，对齐 0.55.2 官方原生 scroller 语法
    scroller {
        column_default_width = one_half
        focus_wrap = false
        focus_fit_method = 0
    }
  '';
}
