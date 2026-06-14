{
  pkgs,
  inputs,
  config,
  ...
}:

let
  fileName = "${config.home.homeDirectory}/Pictures/Screenshots/satty-%Y%m%d-%H%M%S.png";
in
{
  programs.bat.enable = true;
  programs.ripgrep-all.enable = true;
  programs.bottom.enable = true;

  programs.eza = {
    enable = true;
    icons = "auto";
    colors = "auto";
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
  };

  programs.satty = {
    enable = true;
    settings = {
      general = {
        output-filename = fileName;
        early-exit = [ "all" ];
        actions-on-enter = [
          "save-to-file"
          "save-to-clipboard"
        ];

        # --- 窗口尺寸控制 ---
        fullscreen = false; # 确保关闭全屏
        # 设置初始大小，width 1200, height 800 在 1080p 下非常和谐
        resize = {
          mode = "size";
          width = 1200;
          height = 800;
        };
        # 尝试告知 compositor 让它浮动
        #         floating-hack = true;
      };

      keybinds = {
        "space" = "save-to-file,save-to-clipboard,exit";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages = [
    # 浏览器
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # 聊天
    pkgs.telegram-desktop
    pkgs.wechat

    # 影音
    pkgs.mpv # 视频播放
    pkgs.termusic # tui 音乐播放器
    pkgs.yt-dlp # 必须：负责全网搜歌、抓取下载
    pkgs.ffmpeg # 必须：负责将抓取的音频转码为 MP3/FLAC 并写入歌曲标签
    # CLI 工具
    pkgs.wl-clipboard
    pkgs.fastfetch
    pkgs.procs
    pkgs.dust
    pkgs.duf
    pkgs.nixd
    pkgs.nil
    pkgs.llvmPackages.lldb
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];
}
