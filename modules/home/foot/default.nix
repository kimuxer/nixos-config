{ ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true; # 启用 C/S 模式

    settings = {
      main = {
        workers = 4;
        term = "xterm-256color";
        font = "JetBrainsMono NF SemiBold:size=11";
        dpi-aware = "yes"; # 保持自动缩放感知
        pad = "5x5"; # 设置窗口内边距
        resize-delay-ms = 50;
        selection-target = "both";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      cursor = {
        style = "block";
        blink = "no";
      };
      scrollback = {
        lines = 50000;
        multiplier = 3.0;
        indicator-position = "none";
        indicator-format = "none";
      };
      csd = {
        preferred = "none"; # 这会告诉 foot 不要渲染标题栏
        size = 0; # 标题栏高度设为0
        button-width = 0; # 按钮宽度设为0
      };
    };
  };
}
