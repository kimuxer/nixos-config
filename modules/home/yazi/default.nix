{ pkgs, config, ... }:

{
  # 1. 增强依赖包：涵盖图片、视频、PDF、压缩包、代码高亮
  home.packages = with pkgs; [
    ffmpegthumbnailer # 视频预览
    imagemagick            # 图片预览 (提供更强转换支持)
    poppler           # PDF 预览
  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true; # 开启后，退出 yazi 会自动 cd 到最后所在的目录

    # --- [yazi.toml] 基础与预览设置 ---
    settings = {
      manager = {
        ratio = [ 1 3 4 ];        # 比例：左侧预览 1，中间列表 3，右侧预览 4
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        # 【核心】：使用 Kitty 原生协议，享受 1080Ti 带来的像素级清晰度
        preview_proto = "kitty";
        image_filter = "lanczos3"; # 高质量缩放算法
        image_quality = 90;
        max_width = 1500;
        max_height = 1500;
        # 预读缓存
        cache_dir = "${config.home.homeDirectory}/.cache/yazi";
      };

      opener = {
        # 终端编辑器 (Helix)
        edit = [
          { run = ''helix "$@"''; block = true; desc = "Helix"; }
        ];
        # 图形化编辑器 (Zed)
        play = [
          { run = ''zed "$@"''; orphan = true; desc = "Zed Editor"; }
        ];
        # 浏览器 (Zen)
        view = [
          { run = ''zen "$@"''; orphan = true; desc = "Zen Browser"; }
        ];
      };

      open = {
        rules = [
          { name = "*.txt"; use = [ "edit" "play" ]; }
          { name = "*.md"; use = [ "edit" "play" ]; }
          { name = "*.nix"; use = [ "edit" "play" ]; }
          { mime = "text/*"; use = [ "edit" "play" ]; }
          { mime = "image/*"; use = [ "play" ]; }
          { mime = "video/*"; use = [ "view" ]; }
          { mime = "application/pdf"; use = [ "view" ]; }
        ];
      };
    };

    # --- [keymap.toml] 快捷键增强 ---
    keymap = {
      manager.prepend_keymap = [
        # 1. 深度集成 Wayland 剪贴板 (y 复制文件)
        {
          on = [ "y" ];
          run = [
            "copy"
            ''shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' ''
          ];
          desc = "复制文件 (支持跨窗口粘贴到浏览器/Zed)";
        }
        # 2. 智能过滤 (f)
        {
          on = [ "f" ];
          run = "filter --smart";
          desc = "过滤当前目录";
        }
        # 3. 快速进入 Shell
        {
          on = [ "!" ];
          run = "shell \"$SHELL\" --block";
          desc = "在当前目录开启终端";
        }
        # 4. Zoxide 快速跳转
        {
          on = [ "z" ];
          run = "plugin zoxide";
          desc = "跳转到常用目录";
        }
        # 5. 快速打开配置目录
        {
          on = [ "g" "c" ];
          run = "cd /etc/nixos";
          desc = "跳转到 NixOS 配置目录";
        }
      ];
    };

    # --- 优化后的主题：使用终端变量而非死板的颜色值 ---
    theme = {
      manager = {
        # 使用终端的 blue 变量，而不是具体的 #7aa2f7
        hovered = { fg = "black"; bg = "blue"; bold = true; }; 
        
        directory = { fg = "blue"; }; 
        executable = { fg = "green"; };
        symlink = { fg = "cyan"; };
      };

      # 调色板定义：全部设为 null，强制 Yazi 使用终端的主题颜色
      palette = {
        blue = null;
        magenta = null;
        cyan = null;
        green = null;
        orange = null;
        red = null;
      };
    };
  };
}
