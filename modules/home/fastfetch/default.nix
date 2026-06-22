{ pkgs, ... }:

let
  logoContent = ''
   _  ___      ____  ____
  / |/ (_)_ __/ __ \/ __/
 /    / /\ \ / /_/ /\ \
/_/|_/_//_\_\\____/___/
'';

# 在 Nix store 中创建一个临时文件
logoFile = pkgs.writeText "fastfetch-logo.txt" logoContent;
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
          left = 3; # 顶部距离
          top = 0;
          right = 1; # position 设为top后，logo的底部距离
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
        { type = "custom";   key = "╭── system ──────┄"; }
        { type = "os";       key = "│   "; }
        { type = "kernel";   key = "│   "; }
        { type = "wm";       key = "│   "; }
        { type = "shell";    key = "│   "; }
        { type = "terminal"; key = "│   "; }
        { type = "custom";   key = "│    "; }
        { type = "colors";   key = "╰─┄"; symbol = "circle"; }
        "break"
      ];
    };
  };
}
