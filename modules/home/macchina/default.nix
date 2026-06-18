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
        "Packages"
        "WindowManager"
        "Shell"
        "Terminal"
        "ProcessorLoad"
        "DiskSpace"
      ];
    };

    # ==========================================
    # 2. 主题配置 (themes/custom-box.toml)
    # ==========================================
    themes.custom-box = {
      separator = " › ";
      hide_ascii = true;
      spacing = 2;
      padding = 1;

      keys = {
        kernel     = "";
        distro     = "";
        packages   = "";
        wm         = "";
        shell      = "";
        terminal   = "";
        cpu_load   = "";
        disk_space = "";
      };

      box = {
        visible = true;
        border = "rounded";
        title = "NixOS fully-potentiated complete ❄️";
      };

      bar = {
        visible = true;
        glyph = "●";
        hide_delimiters = true;
      };

      palette = {
        visible = true;
        type = "Full";
      };

      randomize = {
        key_color = true;
        separator_color = true;
        pool = "base";
      };
    };
  };
}
