{ ... }:

{
  programs.niri.settings.layout = {
    gaps = 8;
    always-center-single-column = true;
    default-column-display = "normal";
    center-focused-column = "never";
    default-column-width.proportion = 0.5;

    shadow = {
      enable = true;
      softness = 20.0;
      spread = 3.0;
    };
    preset-column-widths = [
      { proportion = 1. / 3.; }
      { proportion = 1. / 2.; }
      { proportion = 2. / 3.; }
    ];
    # --- 标签页列配置 (Tabbed Columns - 重要新特性) ---
    # Niri 现在支持像浏览器标签一样堆叠窗口。当你按下 Mod+W 切换到标签模式时，
    # 下面的设置决定了标签栏的外观。
    tab-indicator = {
      enable = true;      # 开启标签页支持
      gap = 4;
      width = 4;          # 标签栏指示器的高度/宽度
      hide-when-single-tab = true;
      position = "top";
    };

    # --- 聚焦环渐变 (Focus Ring Gradients) ---
    # 官方文档提到 focus-ring 支持渐变色，这能让你的 UI 更有质感。
    focus-ring = {
      enable = true;
      width = 2;
    };
  };
}
