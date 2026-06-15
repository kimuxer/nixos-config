# -- modules/desktop/fonts.nix --
{ pkgs, ... }:
{
  fonts = {
    # 允许软件发现通过 Nix 安装的字体
    fontDir.enable = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      inter
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
    ];

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
