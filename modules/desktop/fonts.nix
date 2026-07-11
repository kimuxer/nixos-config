# -- modules/desktop/fonts.nix --
{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      inter
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
      symbola
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        # --- 终端与代码 ---
        monospace = [
          "JetBrainsMono Nerd Font" 
          "Noto Sans Mono CJK SC"    # 💡 修复：等宽必须用 Mono 版本，否则会导致 Emacs 回退到衬线体
          "Symbols Nerd Font" 
        ];

        # --- 网页与系统 UI (无衬线) ---
        sansSerif = [
          "Inter" 
          "Noto Sans CJK SC"        # 这里保持普通的 Sans 版本没问题
        ];

        # --- 阅读与正式文档 (衬线) ---
        serif = [
          "Noto Serif CJK SC"
          "DejaVu Serif"
        ];

        emoji = [ "Noto Color Emoji" ];
      };

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
