{ pkgs, ... }:

{
  programs.macchina = {
    enable = true;

    # ==========================================
    # 1. 核心配置文件管理 (macchina.toml)
    # ==========================================
    settings = {
      theme = "custom-box";
      show = [
        "Kernel"
        "Distribution"
        "WindowManager"
        "Shell"
        "Terminal"
        "Packages"
      ];
    };

    # ==========================================
    # 2. 主题配置 (themes/custom-box.toml)
    # ==========================================
    themes.custom-box = {
      separator = "";
      hide_ascii = true;
      spacing = 2;
      padding = 3;

      keys = {
        kernel     = "";
        distro     = "";
        wm         = "";
        shell      = "";
        terminal   = "";
        packages   = "";
      };

      box = {
        visible = true;
        #border = "plain";
        border = "rounded";
        #border = "thick";
        #border = "double";
        title = " ❄️ NixOS ";
      };

      bar = {
        visible = true;
        glyph = "●";
        hide_delimiters = true;
      };

      #palette = {
      #  visible = true;
      #  type = "Full";
      #};

      randomize = {
        key_color = true;
        separator_color = true;
        pool = "base";
      };
    };
  };
}
