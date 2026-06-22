{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      # 性能优化：关闭图形预览，使用更快的渲染模式
      gtk-single-instance = true;
      font-size = 12;
      font-family = "JetBrainsMono Nerd Font";

      # 视觉设置
      #theme = "catppuccin-mocha";
      background-opacity = 0.9;
      window-decoration = false;

      # 性能优化：如果你发现 Niri 启动延迟严重，可以尝试将图形加速设为 gl
      graphics = true;

      # 如果你在 Niri 中启动有延迟，可以尝试下面这个设置
      # 它可以让窗口创建得更快
      window-save-state = "never";
    };
  };
}
