{ config, pkgs, ... }:

let
  # 依然保持用 let 绑定路径，这是最稳妥的
  logoFile = ./logo.txt;
in
{
  programs.fastfetch = {
    enable = true;

    # 替换 extraConfig 为 settings
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      
      logo = {
        source = "${logoFile}";
        position = "top";
        padding = {
          left = 3;       # 顶部距离
          top = 0;
	  right = 1;      # position 设为top后，logo的底部距离
        };
      };

      display = {
        bar = {
          char = {
            total = "─";
          };
        };
        percent = {
          type = 3;
          ndigits = 2;
        };
        key = {
          width = 8;
        };
        separator = "";
      };

      modules = [
        {
          type = "custom";
          key = "╭── system ──────┄";
        }
        { type = "os"; key = "│  ›  "; }
        { type = "kernel"; key = "│  ›  "; }
        { type = "wm"; key = "│  ›  "; }
        { type = "shell"; key = "│  ›  "; }
        { type = "terminal"; key = "│  ›  "; }
        { type = "packages"; key = "│  ›  "; }
        { type = "disk"; key = "│  ›  "; format = "{13} {1} / {2} ({3})"; }
        {
          type = "custom";
          key = "╰─┄";
        }
        {
          type = "colors";
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}
