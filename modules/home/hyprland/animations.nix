# modules/home/hyprland/animations.nix
{ ... }:
{
  wayland.windowManager.hyprland.settings = {

    # --- 1. 定义全局动画开关与速度 ---
    animations = {
      enabled = true;

      # 全局动画速度 (数值越大越快，8 约等于 800ms)
      speed = 8.0;

      # --- 2. 定义曲线 (Curves) ---
      # 贝塞尔曲线 (Bezier)
      bezier = [
        "easeOutQuint, 0.23, 1, 0.32, 1"       # 流畅的减速，推荐用于窗口开关
        "easeInOutCubic, 0.65, 0.05, 0.36, 1"  # 平滑缓入缓出
        "overshot, 0.05, 0.9, 0.1, 1.05"       # 带有微弹跳的效果
        "smoothOut, 0.36, 0, 0.66, -0.56"      # 平滑滑出
        "bounce, 0.34, 1.56, 0.64, 1"          # 生动弹跳
      ];

      # --- 3. 配置具体的动画叶子节点 ---
      animation = [
        # >> 窗口打开/关闭/移动 <<
        "windows, 1, 7, easeOutQuint"
        "windowsIn, 1, 7, easeOutQuint, popin 80%"    # 打开时轻微放大再恢复
        "windowsOut, 1, 7, smoothOut, popin 80%"     # 关闭时轻微缩小
        "windowsMove, 1, 7, easeInOutCubic"           # 移动/拖拽时平滑过渡

        # >> 渐隐效果 <<
        "fade, 1, 10, default"
        "fadeIn, 1, 10, easeOutQuint"                 # 窗口淡入
        "fadeOut, 1, 10, smoothOut"                   # 窗口淡出
        "fadeSwitch, 1, 10, easeInOutCubic"           # 切换焦点时透明度过渡
        "fadeShadow, 1, 10, easeInOutCubic"           # 阴影渐变
        "fadeDim, 1, 10, easeOutQuint"                # 非活跃窗口变暗过渡

        # >> 工作区切换 <<
        "workspaces, 1, 6, easeOutQuint, slidefade 20%"  # 带滑动和渐隐的切换

        # >> 边框颜色过渡 <<
        "border, 1, 10, easeInOutCubic"
      ];
    };

    # 可选：如果你更喜欢简约风格，替换上面的 animation 为：
    # animation = [
    #   "windows, 1, 4, default, popin"
    #   "workspaces, 1, 4, default, slidefade"
    #   "fade, 1, 4, default"
    #   "border, 1, 4, default"
    # ];
  };
}