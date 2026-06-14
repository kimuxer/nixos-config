{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      # 1. 绑定你的 Noctalia 配色方案
      theme = "catppuccin_mocha";

      editor = {
        # 🌟 【修复】这里面已经彻底删除了错误的 tab-size！
        line-number = "relative"; # 开启相对行号
        scrolloff = 5; # 光标距离边缘剩 5 行时开始滚动
        mouse = false; # 禁用鼠标

        # 2. 视觉增强
        cursorline = true; # 高亮当前光标所在行
        color-modes = true; # 模式切换时状态栏变色
        completion-trigger-len = 1; # 敲 1 个字母就弹出补全

        # 3. 光标样式
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        # 4. 空格、制表符与边界渲染
        whitespace.render = {
          space = "none";
          tab = "all";
          newline = "none";
        };
        whitespace.characters = {
          tab = "→";
        };

        # 5. 优雅的暗色虚线缩进引导线
        indent-guides = {
          render = true;
          character = "╎";
        };

        # 6. 智能搜索 picker 配置
        file-picker = {
          hidden = false; # 模糊搜索包含隐藏文件
          git-ignore = true; # 尊重 .gitignore
        };

        # 7. 状态栏
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "file-modification-indicator"
          ];
          center = [ "diagnostics" ];
          right = [
            "version-control" # 显示当前 Git 分支
            "selections"
            "primary-selection-length"
            "position"
            "file-encoding"
            "file-type"
          ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };
    };

    # 🌟 【正解】缩进大小应该配在这里！
    languages = {
      language = [
        {
          name = "nix";
          indent = {
            tab-width = 2;
            unit = " ";
          }; # Nix 使用 2 空格
        }
        {
          name = "rust";
          indent = {
            tab-width = 2;
            unit = " ";
          }; # Rust 使用 2 空格
        }
      ];
    };
  };
}
