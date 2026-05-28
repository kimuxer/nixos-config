{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true; # 启用 C/S 模式

    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono NF SemiBold:size=11";
        dpi-aware = "yes"; # 保持自动缩放感知
        pad = "12x12"; # 设置窗口内边距
        resize-delay-ms = 50;
      };

      mouse = {
        hide-when-typing = "yes";
      };

      cursor = {
        style = "block";
        blink = "no";
      };
      scrollback = {
        lines = 25000;
        multiplier = 3.0;
        indicator-position = relative;
        indicator-format = "";
      };
      url = {
        launch = "xdg-open ${url}";
        label-letters = "sadfjklewcmpgh"; # 当进入 URL 模式时显示的快捷键字母
        style = "underline"; # URL 样式，下划线最直观
        osc8-underline = "url-mode"; # 支持 OSC 8 超链接协议
      };
    };
  };
}
