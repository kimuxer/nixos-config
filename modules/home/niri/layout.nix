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
    tab-indicator = {
      enable = true;
      gap = 4;
      width = 4;
      hide-when-single-tab = true;
      position = "top";
    };

    focus-ring = {
      enable = true;
      width = 2;
    };
  };
}
