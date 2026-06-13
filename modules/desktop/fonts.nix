{ pkgs, ... }:

{
  fonts = {
    # 允许软件发现通过 Nix 安装的字体
    fontDir.enable = true;

    packages = with pkgs; [
      # 1. 终端与代码：JetBrains Mono Nerd Font
      nerd-fonts.jetbrains-mono

      # 2. 中文字体：思源黑体 (Noto Sans CJK SC)
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      # 3. UI 字体：Inter (推荐给你的完美 UI 方案)
      inter

      # 4. 表情与符号
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
    ];

    # --- Fontconfig 优先级配置 ---
    # 这一步最重要：它告诉系统，如果字体里没某个字（比如中文），该找谁补位。
    fontconfig = {
      enable = true;
      defaultFonts = {
        # --- 终端与代码 ---
        monospace = [
          "JetBrainsMono Nerd Font"  # 首选：带图标的代码字体
          "Noto Sans CJK SC"         # 补位：中文字符
          "Symbols Nerd Font"        # 补位：特殊图标符号
        ];

        # --- 网页与系统 UI (无衬线) ---
        sansSerif = [
          "Inter"                    # 首选：UI 英文担当
          "Noto Sans CJK SC"         # 补位：系统中文
        ];

        # --- 阅读与正式文档 (衬线) ---
        serif = [
          "Noto Serif CJK SC"
          "DejaVu Serif"
        ];

        # --- 表情 ---
        emoji = [ "Noto Color Emoji" ];
      };

      # 开启一些高级渲染优化
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
      hinting = {
        enable = true;
        style = "slight";
      };
    };
  };
}
