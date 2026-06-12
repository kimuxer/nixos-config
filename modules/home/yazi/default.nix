# Nix 模块导入：引入 pkgs 包管理器，其他参数忽略
{ pkgs, ... }:
{
  # 配置 Yazi 终端文件管理器
  programs.yazi = {
    # 启用 Yazi
    enable = true;

    # 启用 Fish shell 集成（退出 Yazi 后自动切换目录）
    enableFishIntegration = true;

    # 终端输入 y 启动 Yazi（你之前问的那个配置）
    shellWrapperName = "y";

    # 额外安装的依赖工具（用于预览各种文件）
    # Yazi 预览功能强依赖这些工具
    extraPackages = with pkgs; [
      ffmpegthumbnailer # 视频文件预览
      imagemagick # 图片预览、格式转换
      poppler # PDF 文件预览
      ghostscript # 增强 PDF/EPS 等文档预览能力
      unrar # RAR 压缩包解压与预览
    ];

    # Yazi 核心设置（对应 yazi.toml）
    settings = {
      # 文件管理器主界面配置
      manager = {
        ratio = [
          1
          3
          4
        ]; # 三栏比例：左侧栏 / 中间文件列表 / 右侧预览
        sort_by = "natural"; # 自然排序（1 2 10 而非 1 10 2）
        sort_sensitive = false; # 文件名不区分大小写
        sort_reverse = false; # 不反转排序（正序）
        sort_dir_first = true; # 文件夹优先显示在最前面
        show_hidden = true; # 默认显示隐藏文件（.开头的文件）
        show_symlink = true; # 显示符号链接（快捷方式）
        linemode = "size"; # 显示文件大小
        scrolloff = 5; # 滚动时上下保留 5 行边界
        mouse_events = [
          "scroll"
          "move"
          "click"
        ]; # 开启完整鼠标支持
      };

      # 文件预览相关设置
      preview = {
        image_filter = "lanczos3"; # 图片缩放算法（画质最好）
        image_quality = 80; # 预览图片质量 80%
      };

      # 打开方式配置：设置默认编辑器
      opener = {
        # 使用 $EDITOR 打开文件，未设置则默认用 nvim
        # block = true 表示等待编辑器关闭再回到 Yazi
        edit = [
          {
            run = ''\${EDITOR:-nvim} "$@"'';
            block = true;
            desc = "editor";
          }
        ];
      };
    };

    # Yazi 插件安装与自动启用
    plugins = {
      # 全边框插件：界面更美观，带圆角/完整边框
      full-border = {
        package = pkgs.yaziPlugins.full-border;
        #setup = true; # 自动初始化插件（不用写 init.lua）
      };

      # Lazygit 集成：在 Yazi 里直接打开 Git 工具
      lazygit = {
        package = pkgs.yaziPlugins.lazygit;
        #setup = true;
      };

      # Starship 集成：底部状态栏显示主题、Git 分支、路径等
      starship = {
        package = pkgs.yaziPlugins.starship;
        #setup = true;
      };

      # 系统剪贴板插件：支持复制/粘贴文件到系统剪切板
      clipboard = {
        package = pkgs.yaziPlugins.clipboard;
        #setup = true;
      };
    };

    # 快捷键配置（对应 keymap.toml）
    keymap = {
      mgr.prepend_keymap = [
        # Y = 复制到系统剪贴板 (Shift+y)
        {
          on = "Y";
          run = [ "plugin clipboard -- --action=copy --notify-unknown-display-server" ];
        }

        # P = 从系统剪贴板粘贴 (Shift+p)
        {
          on = "P";
          run = [ "plugin clipboard -- --action=paste" ];
        }
      ];
    };
  };
}
